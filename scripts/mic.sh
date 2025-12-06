#!/bin/bash
# Usage:
#   mic.sh toggle
#   mic.sh up
#   mic.sh down
#
# Bind in sxhkd and send signal 17 to i3blocks.

SRC="@DEFAULT_AUDIO_SOURCE@"
STEP="5%"

case "$1" in
  toggle|mute)
    # toggle mute on default source
    wpctl set-mute "$SRC" toggle > /dev/null
    ;;
  up)
    # increase mic gain
    wpctl set-volume "$SRC" "$STEP"+ > /dev/null
    ;;
  down)
    # decrease mic gain
    wpctl set-volume "$SRC" "$STEP"- > /dev/null
    ;;
  *)
    echo "Usage: $0 {toggle|up|down}"
    exit 1
    ;;
esac

# Read back current mic state
info=$(wpctl get-volume "$SRC" 2>/dev/null)
if [ $? -eq 0 ]; then
    vol=$(awk '{print $2}' <<< "$info")
    pct=$(printf "%.0f" "$(echo "$vol * 100" | bc -l)")
    if grep -q '\[MUTED\]' <<< "$info"; then
        notify-send -u low -t 1000 -r 997 "🎙️ Mic: muted"
    else
        notify-send -u low -t 1000 -r 997 "🎙️ Mic: ${pct}%"
    fi
fi

# refresh i3blocks mic block (signal 17 as you used)
pkill -RTMIN+17 i3blocks

