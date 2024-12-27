#!/bin/bash

# MPD Only: 

case "$BLOCK_BUTTON" in
    1) mpc toggle ;; 
    3) mpc prev ;;   
esac

# Get the current song name, truncate to 50 characters, and remove & from the output:
# song=$(mpc current | cut -c 1-50 | sed 's/&//g')
# song=$(mpc current | tr -d '&<>|')
song=$(ncmpcpp --current-song="%f ")

# Extract the current/total timestamp using awk (handles both playing and paused)
timestamps=$(mpc | grep -E "playing|paused" | awk '{print $3}')

# Check if MPD is running and determine output
if [ -z "$song" ] || [ -z "$timestamps" ]; then
    echo "No_music_playing"
else
    if mpc | grep -q "paused"; then
        output="$song [$timestamps] (Paused)"
    else
        output="$song [$timestamps]"
    fi
    echo "$output"
fi
