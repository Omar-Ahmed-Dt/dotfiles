#!/bin/sh 
#mic=$(arecord -l | awk '/USB/ {sub(":","");print $2}')
PIDFILE="/tmp/record.pid"

if [ -s $PIDFILE ]
then
	kill $(cat $PIDFILE)
	rm -rf $PIDFILE
else
	#ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0 -f alsa -i hw:$mic -af "volume=10" ~/ffmpeg/screencast/$(date +%s).mp4 & echo $! > $PIDFILE
  #ffmpeg -framerate 30 -video_size 1920x1080 -f x11grab -i :0 -f pulse -i default -vcodec libx264 -preset fast ~/ffmpeg/screencast/$(date +%s).mp4 & echo $! > $PIDFILE
  #ffmpeg -y -f x11grab -r 30 -s 1920x1080 -i :0.0+0,0 -vcodec libx264 -strict -2 -b:v 16M -f pulse -i default ~/ffmpeg/screencast/$(date +%s).mkv & echo $! > $PIDFILE  # high quality 
 ffmpeg -framerate 28 -video_size 1920x1080 -f x11grab -i :0 -f pulse -i default ~/ffmpeg/screencast/$(date +%s).mkv & echo $! > $PIDFILE

fi

#-video_size : xrandr -q --current | grep '*' | awk '{print$1}'

