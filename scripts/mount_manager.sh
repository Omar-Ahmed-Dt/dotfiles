#!/bin/bash

MOUNT_POINT="/mnt"
DMENU_CMD="dmenu -i -p"

# Get list of block devices
get_block_devices() {
    lsblk -lp | grep "part $" | awk '{print $1, "(" $4 ")"}'
}

# Get mounted block devices
get_mounted_devices() {
    mount | grep "^/dev/" | awk '{print $1}'
}

# Check if device is mounted
is_mounted() {
    local device="$1"
    get_mounted_devices | grep -q "^${device}$"
}

# Mount the device
mount_device() {
    local device="$1"
    sudo mount "$device" "$MOUNT_POINT" && notify-send "Mounted $device at $MOUNT_POINT" || notify-send "Failed to mount $device"
}

# Unmount the device
unmount_device() {
    local device="$1"
    sudo umount "$device" && notify-send "Unmounted $device from $MOUNT_POINT" || notify-send "Failed to unmount $device"
}

# Main script
main() {
    # Check if the /mnt is already in use
    if mountpoint -q "$MOUNT_POINT"; then
        # Give an option to unmount the currently mounted device
        action=$(echo -e "Unmount" | $DMENU_CMD "Device is already mounted. Select action:")
        if [ "$action" == "Unmount" ]; then
            # Get the device mounted on /mnt
            mounted_device=$(mount | grep "on $MOUNT_POINT" | awk '{print $1}')
            # Unmount the device
            unmount_device "$mounted_device"
            exit 0
        else
            exit 0  # Exit if no valid selection is made
        fi
    fi

    # Get available block devices
    devices=$(get_block_devices)
    [ -z "$devices" ] && { notify-send "No available devices found."; exit 1; }

    # Use dmenu to select a device
    selected=$(echo "$devices" | $DMENU_CMD "Select device to mount:")
    [ -z "$selected" ] && exit 0  # Exit if no selection is made

    selected_device=$(echo "$selected" | awk '{print $1}')
    # Mount the selected device
    mount_device "$selected_device"
}

# Run the main script
main

