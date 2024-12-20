#!/bin/bash

PICTURE=/tmp/i3lock.png
SCREENSHOT="scrot -z $PICTURE"

BLUR="5x4"
$SCREENSHOT
magick $PICTURE -blur $BLUR $PICTURE

setxkbmap us && pkill -RTMIN+15 i3blocks
i3lock -k -e --bar-indicator \
       --time-str="%I : %M %p" \
       --date-str="%a - %d %b %Y" \
       -c 000000 \
       --time-color=ecbe7b \
       --date-color=becbe7 \
       --time-size=46 \
       --date-size=16 \
       -i $PICTURE

rm $PICTURE
