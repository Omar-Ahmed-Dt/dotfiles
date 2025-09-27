#!/bin/bash
# Manage encrypted external SSD (/dev/sdb -> /dev/mapper/myssd)
# Usage:
#   ./myssd.sh open   # unlock + mount
#   ./myssd.sh close  # unmount + lock

DEVICE="/dev/sdb"
MAPPER="myssd"
MOUNTPOINT="/mnt/myssd"

open_disk() {
    echo "[*] Unlocking $DEVICE..."
    sudo cryptsetup open "$DEVICE" "$MAPPER" || exit 1

    echo "[*] Mounting /dev/mapper/$MAPPER to $MOUNTPOINT..."
    sudo mkdir -p "$MOUNTPOINT"
    sudo mount "/dev/mapper/$MAPPER" "$MOUNTPOINT" || {
        echo "[!] Mount failed, closing mapper..."
        sudo cryptsetup close "$MAPPER"
        exit 1
    }

    echo "[+] Disk mounted at $MOUNTPOINT"
}

close_disk() {
    echo "[*] Unmounting $MOUNTPOINT..."
    sudo umount "$MOUNTPOINT" || {
        echo "[!] Failed to unmount $MOUNTPOINT"
        exit 1
    }

    echo "[*] Closing /dev/mapper/$MAPPER..."
    sudo cryptsetup close "$MAPPER" || {
        echo "[!] Failed to close $MAPPER"
        exit 1
    }

    echo "[+] Disk closed successfully"
}

case "${1:-}" in
    mount)
        open_disk
        ;;
    umount)
        close_disk
        ;;
    *)
        echo "Usage: $0 {mount|umount}"
        exit 1
        ;;
esac

