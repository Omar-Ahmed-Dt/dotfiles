#!/usr/bin/env sh
# echo $(xkb-switch)
setxkbmap -query | grep layout | awk '{printf $2}'
