#!/bin/bash

# Setup correct environment for X11 + DBus
export DISPLAY=:0
for i in $(seq 10); do
    if xsetwacom list devices | grep -q Wacom; then
        break
    fi
    sleep 1
done


/home/omar/scripts/keys.sh


# xsetwacom list devices
#
pad_index=$(xsetwacom list devices | grep PAD | awk '{printf $7}')
stylus_index=$(xsetwacom list devices | grep STYLUS | awk '{printf $7}')


# set first left button for wacom pad as c+z
xsetwacom set "${pad_index}" Button 1 "key +ctrl z -ctrl"

# select pin
xsetwacom set "${pad_index}" Button 2 "key +ctrl 1"
# select eraser
xsetwacom set "${pad_index}" Button 3 "key +ctrl 4"
xsetwacom set "${pad_index}" Button 8 "key +ctrl 5"

# 
# set ratio for rnote program: 
# slop -f "%wx%h+%x+%y"
xsetwacom set "${stylus_index}" MapToOutput 1893x987+15+83

# Get device name
name=$(lsusb | awk '/Wacom/ {print}' | cut -f7- -d' ')
# notify-send "🎨 Device: <b>${name}</b> is connected"
sudo -u omar DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus dunstify "Wacom Table is Plugged" -t 1500 -i /home/omar/logo/theme.png
