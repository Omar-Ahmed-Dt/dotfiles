#!/usr/bin/env sh
# echo $(xkb-switch)
lan=`setxkbmap -query | grep layout | awk '{printf $2}'`

if [ lan=="ar" ]
then
 setxkbmap us && pkill -RTMIN+15 i3blocks
# elif [ lan=="us" ]
# then
#     dmenu_run
else 
 setxkbmap us && pkill -RTMIN+15 i3blocks
fi
