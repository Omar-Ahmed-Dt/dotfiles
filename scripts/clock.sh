#!/bin/sh

case "$BLOCK_BUTTON" in
    3)
        ~/scripts/power.sh
        # pkill i3 
        ;;
    1)
        alacritty --working-directory "$HOME" &
        ;;
esac

echo "$(date '+%d-%-m %a %-I:%M %p')"

