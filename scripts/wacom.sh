#!/bin/bash
set -e

# ---- Pull real X11/DBus env from an existing GUI process (most reliable) ----
GUI_PID="$(pgrep -u omar -n -x i3)"

if [ -n "$GUI_PID" ] && [ -r "/proc/$GUI_PID/environ" ]; then
  # Import env vars from that process
  export DISPLAY="$(tr '\0' '\n' < /proc/$GUI_PID/environ | sed -n 's/^DISPLAY=//p' | head -n1)"
  export XAUTHORITY="$(tr '\0' '\n' < /proc/$GUI_PID/environ | sed -n 's/^XAUTHORITY=//p' | head -n1)"
  export DBUS_SESSION_BUS_ADDRESS="$(tr '\0' '\n' < /proc/$GUI_PID/environ | sed -n 's/^DBUS_SESSION_BUS_ADDRESS=//p' | head -n1)"
fi

# Fallbacks (in case XAUTHORITY isn't set in the session env)
: "${DISPLAY:=:0}"
: "${XAUTHORITY:=/home/omar/.Xauthority}"
: "${DBUS_SESSION_BUS_ADDRESS:=unix:path=/run/user/1000/bus}"

# ---- Wait until X sees the tablet ----
for i in $(seq 20); do
  xsetwacom list devices 2>/dev/null | grep -q Wacom && break
  sleep 1
done

pad_index=$(xsetwacom list devices | awk -F'id: ' '/PAD/ {print $2}' | awk '{print $1; exit}')
stylus_index=$(xsetwacom list devices | awk -F'id: ' '/STYLUS/ {print $2}' | awk '{print $1; exit}')

[ -n "$pad_index" ] && xsetwacom set "$pad_index" Button 1 "key +ctrl z -ctrl"
[ -n "$pad_index" ] && xsetwacom set "$pad_index" Button 2 "key +ctrl 1"
[ -n "$pad_index" ] && xsetwacom set "$pad_index" Button 3 "key +ctrl 4"
[ -n "$pad_index" ] && xsetwacom set "$pad_index" Button 8 "key +ctrl 5"

[ -n "$stylus_index" ] && xsetwacom set "$stylus_index" MapToOutput 1893x987+15+83

dunstify "Wacom Tablet is Plugged" -t 1500 -i /home/omar/logo/theme.png
