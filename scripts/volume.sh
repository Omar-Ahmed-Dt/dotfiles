#!/bin/bash
# PipeWire volume control via pactl (works with pipewire-media-session + pipewire-pulse)

STEP="5%"

case "$1" in
  up)
    pactl set-sink-volume @DEFAULT_SINK@ +$STEP
    ;;
  down)
    pactl set-sink-volume @DEFAULT_SINK@ -$STEP
    ;;
  mute|toggle)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;
  *)
    echo "Usage: $0 {up|down|mute}"
    exit 1
    ;;
esac

# Read volume + mute state
VOL_LINE=$(pactl get-sink-volume @DEFAULT_SINK@ | head -n1)
MUTE_LINE=$(pactl get-sink-mute @DEFAULT_SINK@)

VOL_PCT=$(echo "$VOL_LINE" | grep -oE '[0-9]+%' | head -n1)

if echo "$MUTE_LINE" | grep -q "yes"; then
  notify-send -u low -t 1000 -r 999 "🔇 Muted"
else
  notify-send -u low -t 1000 -r 999 "🔊 Volume: ${VOL_PCT}"
fi

pkill -RTMIN+10 -x i3blocks

