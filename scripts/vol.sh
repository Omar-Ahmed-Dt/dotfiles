#!/bin/bash
case $BLOCK_BUTTON in
	1) amixer -q set Master toggle && pkill -RTMIN+10 i3blocks ;;  # left click
	3) pavucontrol ;;  # right click
#	2) whatever_you_want_to_run ;;  # middle click
	4) amixer -q set Master 5%+ && pkill -RTMIN+10 i3blocks ;;  # scroll up
	5) amixer -q set Master 5%- && pkill -RTMIN+10 i3blocks ;;  # scroll down
esac

wpctl get-volume @DEFAULT_AUDIO_SINK@


