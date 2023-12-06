#!/bin/bash


for i in $(seq 10); do
    if xsetwacom list devices | grep -q Wacom; then
        break
    fi
    sleep 1
done

# /usr/local/bin/keys.sh


# xsetwacom list devices
#
pad_index=$(xsetwacom list devices | grep PAD | awk '{printf $7}')
stylus_index=$(xsetwacom list devices | grep STYLUS | awk '{printf $7}')


# set first left button for wacom pad as c+z
xsetwacom set "${pad_index}" Button 1 "key +ctrl z -ctrl"

# ratio with p3-onenote
# slop -f "%wx%h+%x+%y"
xsetwacom set "${stylus_index}" MapToOutput 1415x853+465+194

# Get device name
# name=$(lsusb | awk '/Wacom/ {print}' | cut -f7- -d' ')
# notify-send "🎨 $name"
