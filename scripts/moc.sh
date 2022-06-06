#!/bin/bash
case $BLOCK_BUTTON in
	1) mocp -r && pkill -RTMIN+3 i3blocks ;;  # left click
	3) mocp -f && pkill -RTMIN+3 i3blocks ;;  # right click
	2) mocp -G && pkill -RTMIN+3 i3blocks ;;	# middle click
#	4) pkill -RTMIN+3 i3blocks ;;  # scroll up
#	5) pkill -RTMIN+3 i3blocks ;;  # scroll down
esac

name=$(mocp -Q %file | awk -F/ '{print $NF}' | awk -F. '{print $1}' ) 
if [[ ! -z $name ]]; then
    echo $name && pkill -RTMIN+3 i3blocks 
else 
    pkill -RTMIN+3 i3blocks
fi 

#SONGTITLE=$(mocp -i | grep 'SongTitle:' | sed -e 's/^.*: //');
#ARTIST=$(mocp -i | grep 'Artist:' | sed -e 's/^.*: //');
#ALBUM=$(mocp -i | grep 'Album:' | sed -e 's/^.*: //');
#FILENAME=$(mocp -i | grep "File" | sed 's/File: //' | sed 's/.*\///')
#if [[ ! -z $ARTIST ]]; then
    #echo "   $ARTIST - $SONGTITLE  <span foreground='#4e4e4e'>($ALBUM)</span> "; pkill -RTMIN+3 i3blocks
#    echo "$ARTIST - $SONGTITLE" && pkill -RTMIN+3 i3blocks
#elif [[ ! -z $FILENAME ]]; then
#    echo "$FILENAME" && pkill -RTMIN+3 i3blocks
#else
#    pkill -RTMIN+3 i3blocks
#fi
