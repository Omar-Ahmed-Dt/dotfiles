#!/bin/sh 
PIDFILE="/tmp/record.pid"

if [ -s $PIDFILE ]
then
	kill $(cat $PIDFILE)
	rm -rf $PIDFILE
else
  #ffmpeg -framerate 30 -video_size 1920x1080 -f x11grab -i :0 -f pulse -i default -vcodec libx264 -preset fast ~/ffmpeg/screencast/$(date +%s).mp4 & echo $! > $PIDFILE
  ffmpeg -framerate 28 -video_size 1920x1080 -f x11grab -i :0.0 -f pulse -i default ~/ffmpeg/screencast/$(date +%s).mkv & echo $! > $PIDFILE
  #
  # Lossless Recording 
  # ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0 -f pulse -i default -c:v libx264rgb -crf 0 -preset ultrafast -color_range 2 ~/ffmpeg/screencast/$(date +%s).mkv & echo $! > $PIDFILE
  #
  #
  #ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0 -f pulse -ac 2 -i default ~/ffmpeg/screencast/$(date +%s).mkv & echo $! > $PIDFILE

fi
