#!/bin/bash
OPT=$(echo -e "Voice\nVideo" | dmenu -c -l 2 -p "Choose action: ")
case $OPT in
	Voice )     kitty -e /home/omar/scripts/mp3.sh ;;
	Video )     kitty -e /home/omar/scripts/mp4.sh ;; 
	*) ;;
esac
