#!/bin/bash
# storage_manager.sh — unified manager for plain and LUKS (crypto_LUKS) external drives.
# Requires: cryptsetup, lsblk, udisks2 (udisksctl), dmenu, coreutils, mount/umount
#
# Usage examples:
#   ./storage_manager.sh open           # Select a crypto_LUKS device via dmenu -> unlock & mount to /mnt/myssd
#   ./storage_manager.sh close          # Unmount & lock last opened encrypted device -> power off its base disk
#   ./storage_manager.sh mount          # Select plain device via dmenu -> mount to /mnt/usb
#   ./storage_manager.sh unmount-poweroff  # Unmount plain device at /mnt/usb and power off
#
# Notes:
# - Encrypted (LUKS) mountpoint: /mnt/myssd (change CRYPT_MOUNTPOINT if you like)
# - Plain device mountpoint:     /mnt/usb   (change PLAIN_MOUNTPOINT if you like)
# - The script stores state in $STATE_FILE to know which encrypted device to close later.

set -euo pipefail

# ---- Config ----
PLAIN_MOUNTPOINT="/mnt/usb"
CRYPT_MOUNTPOINT="/mnt/myssd"
DMENU_CMD="dmenu -i -p"
NOTIFY=${NOTIFY:-1}   # set to 0 to disable notify-send

# State file to remember the last opened encrypted volume
STATE_DIR="$(mkdir -p "/run/user/$(id -u)/storage_manager" && echo "/run/user/$(id -u)/storage_manager")"
STATE_FILE="$STATE_DIR/encrypted_state"

notify() {
    local msg="$1"
    if [ "$NOTIFY" -eq 1 ] && command -v notify-send >/dev/null 2>&1; then
        notify-send "$msg" || true
    fi
    echo "$msg"
}

# ---------- Helpers ----------
get_plain_candidates() {
    # List partitions or whole disks that have a filesystem and are not mounted
    # Format: "/dev/sdX1 (SIZE, FSTYPE)"
    lsblk -pnlo NAME,RM,SIZE,TYPE,FSTYPE,MOUNTPOINT \
    | awk '$6=="" && $5!="" && ($4=="part" || $4=="disk") {printf "%s (%s, %s)\n",$1,$3,$5}' \
    | sort -u
}

get_crypto_candidates() {
    # List devices that are LUKS containers (FSTYPE=crypto_LUKS) and not mounted (containers themselves won’t have mountpoints)
    # Typical is /dev/sdX1, but we include whole disk too in case user did LUKS on /dev/sdX
    lsblk -pnlo NAME,FSTYPE,MOUNTPOINT \
    | awk '$2=="crypto_LUKS" {print $1}' \
    | while read -r dev; do
        # If any child is mapped/mounted, we still show the container (close handles that)
        printf "%s (LUKS)\n" "$dev"
    done
}

get_mapper_fs() {
    # Detect filesystem inside an unlocked mapper (e.g., ext4, xfs)
    local mapper_dev="$1"
    lsblk -no FSTYPE "$mapper_dev" | head -n1
}

is_mounted_mp() {
    local mp="$1"
    mountpoint -q "$mp"
}

get_base_device() {
    # Resolve the base disk for any device (/dev/sdb1 -> /dev/sdb, /dev/mapper/* -> underlying /dev/sdX or nvme)
    # For mappers, traverse until we hit a "disk"
    local dev="$1"
    # Normalize to a canonical NAME from lsblk
    local current="$dev"
    while :; do
        local type
        type="$(lsblk -no TYPE "$current" 2>/dev/null | head -n1 || true)"
        if [ "$type" = "disk" ]; then
            echo "$current"
            return
        fi
        # Get parent by PKNAME (kernel name) or by following holders
        local pk
        pk="$(lsblk -no PKNAME "$current" 2>/dev/null | head -n1 || true)"
        if [ -n "$pk" ]; then
            # Add /dev/ if missing
            if [[ "$pk" = /* ]]; then
                current="$pk"
            else
                current="/dev/$pk"
            fi
        else
            # Try first parent via lsblk tree
            local parent
            parent="$(lsblk -pnro NAME "$current" 2>/dev/null | head -n1 || true)"
            if [ -z "$parent" ] || [ "$parent" = "$current" ]; then
                echo "$dev"   # fallback
                return
            fi
            current="$parent"
        fi
    done
}

# ---------- Plain devices ----------
mount_plain() {
    local devices selected selected_dev
    devices="$(get_plain_candidates || true)"
    if [ -z "${devices:-}" ]; then
        notify "No available devices found."
        exit 1
    fi
    selected="$(echo "$devices" | $DMENU_CMD "Select plain device to mount:")" || exit 1
    [ -z "$selected" ] && exit 0
    selected_dev="$(printf "%s\n" "$selected" | awk '{print $1}')"

    sudo mkdir -p "$PLAIN_MOUNTPOINT"

    # Prefer using detected fstype for reliability
    local fstype
    fstype="$(lsblk -no FSTYPE "$selected_dev" | head -n1 || true)"
    if [ -n "$fstype" ]; then
        sudo mount -t "$fstype" "$selected_dev" "$PLAIN_MOUNTPOINT" || { notify "Failed to mount $selected_dev"; exit 1; }
    else
        sudo mount "$selected_dev" "$PLAIN_MOUNTPOINT" || { notify "Failed to mount $selected_dev"; exit 1; }
    fi
    notify "Mounted $selected_dev at $PLAIN_MOUNTPOINT"
}


unmount_plain_poweroff() {
    if ! is_mounted_mp "$PLAIN_MOUNTPOINT"; then
        notify "$PLAIN_MOUNTPOINT is not mounted."
        exit 0
    fi
    local dev base
    dev="$(mount | awk -v mp=" on $PLAIN_MOUNTPOINT " '$0 ~ mp {print $1; exit}')"
    sudo umount "$PLAIN_MOUNTPOINT" || { notify "Failed to unmount $PLAIN_MOUNTPOINT"; exit 1; }
    base="$(get_base_device "$dev")"
    sync
    if sudo udisksctl power-off -b "$base" >/dev/null 2>&1; then
        notify "Powered off $base — safe to remove"
    else
        notify "Failed to power off $base"
        exit 1
    fi
}

# ---------- Encrypted (LUKS) ----------
open_encrypted() {
    local devices selected DEVICE MAPPER mapper_dev inner_fs

    devices="$(get_crypto_candidates || true)"
    if [ -z "${devices:-}" ]; then
        notify "No crypto_LUKS devices found."
        exit 1
    fi
    selected="$(echo "$devices" | $DMENU_CMD "Select LUKS device to unlock:")" || exit 1
    [ -z "$selected" ] && exit 0
    DEVICE="$(printf "%s\n" "$selected" | awk '{print $1}')"

    # Pick mapper name: prefer LABEL if present, else basename with '-crypt'
    local label base
    label="$(lsblk -no LABEL "$DEVICE" | head -n1 || true)"
    base="$(basename "$DEVICE")"
    if [ -n "$label" ]; then
        MAPPER="${label}"
    else
        MAPPER="${base}-crypt"
    fi

    # Allow user to confirm/override mapper name via dmenu
    if command -v dmenu >/dev/null 2>&1; then
        local proposed="$MAPPER"
        local input
        input="$(printf "%s\n" "$proposed" | dmenu -p "Mapper name:")" || true
        [ -n "${input:-}" ] && MAPPER="$input"
    fi

    notify "Unlocking $DEVICE as /dev/mapper/$MAPPER ..."
    sudo cryptsetup open "$DEVICE" "$MAPPER" || { notify "cryptsetup open failed"; exit 1; }

    mapper_dev="/dev/mapper/$MAPPER"
    inner_fs="$(get_mapper_fs "$mapper_dev" || true)"

    sudo mkdir -p "$CRYPT_MOUNTPOINT"
    if [ -n "$inner_fs" ]; then
        sudo mount -t "$inner_fs" "$mapper_dev" "$CRYPT_MOUNTPOINT" || {
            notify "Mount failed, closing mapper..."
            sudo cryptsetup close "$MAPPER" || true
            exit 1
        }
    else
        # Let mount auto-detect fs (works if lsblk doesn't report it yet)
        sudo mount "$mapper_dev" "$CRYPT_MOUNTPOINT" || {
            notify "Mount failed, closing mapper..."
            sudo cryptsetup close "$MAPPER" || true
            exit 1
        }
    fi

    # Save state for easy close later
    {
        echo "DEVICE=$DEVICE"
        echo "MAPPER=$MAPPER"
        echo "MOUNTPOINT=$CRYPT_MOUNTPOINT"
    } > "$STATE_FILE"

    notify "Encrypted disk mounted: $mapper_dev -> $CRYPT_MOUNTPOINT"
}

close_encrypted() {
    # Prefer state file; if missing, try to infer from mountpoint
    local DEVICE MAPPER MOUNTPOINT mapper_dev base

    if [ -f "$STATE_FILE" ]; then
        # shellcheck disable=SC1090
        source "$STATE_FILE"
    else
        # Try infer from mountpoint
        if ! is_mounted_mp "$CRYPT_MOUNTPOINT"; then
            notify "No encrypted mount found at $CRYPT_MOUNTPOINT and no state file present."
            exit 1
        fi
        mapper_dev="$(mount | awk -v mp=" on $CRYPT_MOUNTPOINT " '$0 ~ mp {print $1; exit}')"
        MAPPER="$(basename "$mapper_dev")"
        # Resolve underlying (container) device using lsblk
        DEVICE="$(lsblk -pnro NAME,TYPE "$mapper_dev" | awk 'NR==2{print $1; exit}')"
        [ -z "$DEVICE" ] && DEVICE="$mapper_dev"
        MOUNTPOINT="$CRYPT_MOUNTPOINT"
    fi

    mapper_dev="/dev/mapper/$MAPPER"

    notify "Unmounting $MOUNTPOINT ..."
    sudo umount "$MOUNTPOINT" || { notify "Failed to unmount $MOUNTPOINT"; exit 1; }

    notify "Closing mapper $MAPPER ..."
    sudo cryptsetup close "$MAPPER" || { notify "Failed to close $MAPPER"; exit 1; }

    # Power off base device (container may be /dev/sdX or /dev/sdX1)
    base="$(get_base_device "$DEVICE")"
    sync
    if sudo udisksctl power-off -b "$base" >/dev/null 2>&1; then
        notify "Powered off $base — safe to remove"
    else
        notify "Failed to power off $base"
        exit 1
    fi

    rm -f "$STATE_FILE" || true
    notify "Encrypted disk closed and powered off successfully"
}

# ---------- CLI ----------
cmd="${1:-help}"
case "$cmd" in
    open)              open_encrypted ;;
    close)             close_encrypted ;;
    mount)             mount_plain ;;
    unmount-poweroff)  unmount_plain_poweroff ;;
    help|--help|-h)
        cat <<EOF

Commands:

# 1. Plain Devices:
  mount               Mount a plain device to $PLAIN_MOUNTPOINT (dmenu to select)
  unmount-poweroff    Unmount plain device and power off its base disk

# 2. Encrypted Devices:
  open                Unlock a LUKS (crypto_LUKS) device, mount to $CRYPT_MOUNTPOINT (dmenu to select)
  close               Unmount, lock the last opened encrypted device, and power it off

Env vars you may tweak:
  PLAIN_MOUNTPOINT="$PLAIN_MOUNTPOINT"
  CRYPT_MOUNTPOINT="$CRYPT_MOUNTPOINT"
  DMENU_CMD="$DMENU_CMD"
  NOTIFY=$NOTIFY  (set to 0 to disable notify-send)

EOF
        ;;
    *)
        echo "Unknown command: $cmd"
        echo "Try: $0 help"
        exit 1
        ;;
esac

