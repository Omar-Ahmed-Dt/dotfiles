#!/bin/bash


case "$BLOCK_BUTTON" in
    1) mpc toggle ;;
esac

# Get the current song name using ncmpcpp
song=$(ncmpcpp --current-song="%f")

# Get the duration using mpc
duration=$(mpc | grep "playing" | awk '{print $3}')

# Check if song or duration is empty
if [ -z "$song" ] || [ -z "$duration" ]; then
    echo "No music playing"
else
    echo "$song [$duration]"
fi
