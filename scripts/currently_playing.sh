#!/bin/bash
case "$BLOCK_BUTTON" in
    1) mpc toggle ;;  # Left click to toggle play/pause
    3) mpc prev ;;    # Right click to play the previous song
esac

# Get the current song name
song=$(mpc current)

# Extract the current/total timestamp using awk (handles both playing and paused)
timestamps=$(mpc | grep -E "playing|paused" | awk '{print $3}')

# Check if MPD is running and determine output
if [ -z "$song" ] || [ -z "$timestamps" ]; then
    echo "No music playing"
else
    if mpc | grep -q "paused"; then
        echo "$song [$timestamps] (Paused)"
    else
        echo "$song [$timestamps]"
    fi
fi
