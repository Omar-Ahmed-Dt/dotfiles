#!/bin/sh 
PIDFILE="/tmp/record.pid"

if [ -s $PIDFILE ]
then
	kill $(cat $PIDFILE)
	rm -rf $PIDFILE
else
  #ffmpeg -framerate 30 -video_size 1920x1080 -f x11grab -i :0 -f pulse -i default -vcodec libx264 -preset fast ~/ffmpeg/screencast/$(date +%s).mp4 & echo $! > $PIDFILE
 ffmpeg -framerate 28 -video_size 1920x1080 -f x11grab -i :0 -f pulse -i default ~/ffmpeg/screencast/$(date +%s).mkv & echo $! > $PIDFILE

fi
