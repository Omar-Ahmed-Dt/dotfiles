#!/bin/bash
OPT=$(echo -e "Voice\nVideo" | dmenu -c -l 2 -p "Choose action: ")
case $OPT in
	Voice )     alacritty -e /home/omar/scripts/mp3.sh ;;
	Video )     alacritty -e /home/omar/scripts/mp4.sh ;; 
	*) ;;
esac
