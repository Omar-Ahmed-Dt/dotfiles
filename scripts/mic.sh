#!/bin/bash
# PipeWire mic control via pactl (works with pipewire-media-session + pipewire-pulse)

STEP="5%"

case "$1" in
  toggle|mute)
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
    ;;
  up)
    pactl set-source-volume @DEFAULT_SOURCE@ +$STEP
    ;;
  down)
    pactl set-source-volume @DEFAULT_SOURCE@ -$STEP
    ;;
  *)
    echo "Usage: $0 {toggle|up|down}"
    exit 1
    ;;
esac

# Read back current mic state
VOL_LINE=$(pactl get-source-volume @DEFAULT_SOURCE@ | head -n1)
MUTE_LINE=$(pactl get-source-mute @DEFAULT_SOURCE@)

PCT=$(echo "$VOL_LINE" | grep -oE '[0-9]+%' | head -n1)

if echo "$MUTE_LINE" | grep -q "yes"; then
  notify-send -u low -t 1000 -r 997 "🎙️ Mic: muted"
else
  notify-send -u low -t 1000 -r 997 "🎙️ Mic: ${PCT}"
fi

pkill -RTMIN+17 -x i3blocks

