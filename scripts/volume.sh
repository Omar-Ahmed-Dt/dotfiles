#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

case $1 in
    up)
        pamixer -i 5
        ;;
    down)
        pamixer -d 5
        ;;
    mute)
        pamixer -t
        ;;
esac

# Get updated status after change
MUTED=$(pamixer --get-mute)
VOL=$(pamixer --get-volume)

if [ "$MUTED" = "true" ]; then
    notify-send -u low -t 1000 -r 999 "🔇 Muted"
else
    notify-send -u low -t 1000 -r 999 "🔊 Volume: ${VOL}%"
fi

