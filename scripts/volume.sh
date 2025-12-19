#!/bin/bash
# PipeWire-native volume control using wpctl
# Usage:
#   ./volume.sh up
#   ./volume.sh down
#   ./volume.sh mute

SINK="@DEFAULT_AUDIO_SINK@"   # Automatically follows current default sink
STEP="5%"                     # Volume step

case "$1" in
    up)
        wpctl set-volume "$SINK" "$STEP"+ > /dev/null
        ;;
    down)
        wpctl set-volume "$SINK" "$STEP"- > /dev/null
        ;;
    mute|toggle)
        wpctl set-mute "$SINK" toggle > /dev/null
        ;;
    *)
        echo "Usage: $0 {up|down|mute}"
        exit 1
        ;;
esac

# --- Get current state -------------------------------------------------------
# Example wpctl output:
#   Volume: 0.34 [MUTED]
#   Volume: 0.45
VOL_INFO=$(wpctl get-volume "$SINK")
VOL=$(awk '{print $2}' <<< "$VOL_INFO")
VOL_PCT=$(printf "%.0f" "$(echo "$VOL * 100" | bc -l)")

# Check mute state
if grep -q '\[MUTED\]' <<< "$VOL_INFO"; then
    notify-send -u low -t 1000 -r 999 "🔇 Muted"
else
    notify-send -u low -t 1000 -r 999 "🔊 Volume: ${VOL_PCT}%"
fi

# --- Trigger i3blocks refresh ------------------------------------------------
pkill -RTMIN+10 i3blocks
