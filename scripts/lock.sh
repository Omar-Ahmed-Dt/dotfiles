#!/bin/bash
setxkbmap us && pkill -RTMIN+15 i3blocks
i3lock -k -e --bar-indicator \
       --time-str="%I : %M %p" \
       --date-str="%a - %d %b %Y" \
       -c 000000 \
       --time-color=ecbe7b \
       --date-color=becbe7 \
       --time-size=46 \
       --date-size=16 \

