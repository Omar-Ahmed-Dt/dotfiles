#!/usr/bin/env bash

filter() { mpc | sed "/^volume:/d;s/\\&/&amp;/g;s/\\[paused\\].*/⏸/g;/\\[playing\\].*/d;/^ERROR/Q" | paste -sd ' ' -;}

pidof -x sb-mpdup >/dev/null 2>&1 || sb-mpdup >/dev/null 2>&1 &

case $BLOCK_BUTTON in
	1) mpc status | filter ; setsid -f "$TERMINAL" -e ncmpcpp ;;  # right click, pause/unpause
	2) mpc toggle | filter ;;  # right click, pause/unpause
	3) mpc status | filter ; notify-send "🎵 Music module" "\- Shows mpd song playing.
- ⏸ when paused.
- Left click opens ncmpcpp.
- Middle click pauses.
- Scroll changes track.";;  # right click, pause/unpause
	4) mpc prev   | filter ;;  # scroll up, previous
	5) mpc next   | filter ;;  # scroll down, next
	6) mpc status | filter ; "$TERMINAL" -e "$EDITOR" "$0" ;;
	*) mpc status | filter ;;
esac


#while true; do
#  if ! mpc idle > /dev/null; then
#    sleep 120
#  fi
#  if mpc status | grep playing > /dev/null; then
#    echo "$(mpc current)"
#  else
#    echo
#  fi
#done



