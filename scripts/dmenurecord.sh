#!/bin/bash

PIDFILE="/tmp/record.pid"

if [ -s $PIDFILE ]  
then
OPT=$(echo -e "Pause\nContinue\nKill" | dmenu -p "Choose Action : ")
    case $OPT in 
      Pause ) pkill -STOP ffmpeg ;; 
      Continue ) pkill  -CONT ffmpeg ;;
      Kill ) pkill -9 ffmpeg && pkill -RTMIN+5 i3blocks ;;
      *) ;; 
    esac 
else
OPT=$(echo -e "Start" | dmenu -p "Choose Action : ")
    case $OPT in 
      Start ) ~/scripts/recordscreen.sh && pkill -RTMIN+5 i3blocks ;;
      *) ;; 
    esac 
fi 
