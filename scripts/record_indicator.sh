#!/bin/bash
if [ -f /tmp/ffmpeg_indicator ] && [ -f /tmp/recordingpid ]; then
    pkill -CONT -f ffmpeg && rm /tmp/ffmpeg_indicator && pkill -RTMIN+30 i3blocks
elif [ -f /tmp/recordingpid ]; then
    touch /tmp/ffmpeg_indicator && pkill -STOP -f ffmpeg &&  echo " 🛑" && pkill -RTMIN+30 i3blocks 
    # touch /tmp/ffmpeg_indicator && pkill -STOP -f ffmpeg #&&  echo " 🛑"
else
    notify-send -t 2000 -i ~/logo/error3.jpg "No ffmpeg recording !"
fi
