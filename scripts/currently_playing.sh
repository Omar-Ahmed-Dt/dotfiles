#!/bin/bash

case "$BLOCK_BUTTON" in
    1) mpc toggle ;;  # Left click to toggle play/pause
    3) mpc prev ;;    # Right click to play the previous song
esac

# Get the current song name, truncate to 50 characters, and remove & from the output:
# song=$(mpc current | cut -c 1-50 | sed 's/&//g')
song=$(mpc current | tr -d '&<>|-')

# Extract the current/total timestamp using awk (handles both playing and paused)
timestamps=$(mpc | grep -E "playing|paused" | awk '{print $3}')

# Check if MPD is running and determine output
if [ -z "$song" ] || [ -z "$timestamps" ]; then
    echo "No_music_playing"
    echo "No_music_playing" > /tmp/i3blocks_music.log
else
    if mpc | grep -q "paused"; then
        output="$song [$timestamps] (Paused)"
    else
        output="$song [$timestamps]"
    fi
    echo "$output"
fi
