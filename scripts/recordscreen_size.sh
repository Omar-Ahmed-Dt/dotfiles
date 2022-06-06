#!/bin/bash

PIDFILE="/tmp/record.pid"

if [ -s $PIDFILE ]
then
	kill $(cat $PIDFILE)
	rm -rf $PIDFILE
else
  slop -f "%x %y %w %h" > /tmp/slop
  read -r X Y W H < /tmp/slop
  rm /tmp/slop
	#ffmpeg -f x11grab -framerate 30 -video_size "$W"x"$H" -i :0.0+"$X,$Y" -c:v libx264 -qp 0 -r 30 -f pulse -i default ~/ffmpeg/screencast/$(date +%s).mp4 & echo $! > $PIDFILE
	ffmpeg -f x11grab -framerate 28 -video_size "$W"x"$H" -i :0.0+"$X,$Y" -f pulse -i default ~/ffmpeg/screencast/$(date +%s).mkv & echo $! > $PIDFILE

fi

