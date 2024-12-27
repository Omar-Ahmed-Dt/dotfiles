#!/bin/bash

case "$BLOCK_BUTTON" in
    1) setxkbmap -query | grep -q "layout:\s\+us" && setxkbmap ara || setxkbmap us && pkill -RTMIN+15 i3blocks ;; 
esac

output=$(xkb-switch | xargs echo | awk -F '(' '{print $1}')
echo $output
