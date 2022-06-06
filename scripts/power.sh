#!/bin/bash
#OPT=$(echo -e "lock\nlogout\nreboot\nsuspend\nhibernate\nshutdown" | dmenu -p "Choose action: ")
OPT=$(echo -e "lock\nlogout\nreboot\nsuspend\nhibernate\nshutdown" | dmenu  -p "Choose action: ")
#OPT=$(echo -e "lock\nlogout\nreboot\nsuspend\nhibernate\nshutdown" | dmenu  -fn 'NotoMonoRegular:bold:pixelsize=18' -p "Choose action: ")
case $OPT in
	lock ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really lock?")" = "Yes" ] && betterlockscreen -l dimblur -- --time-str="%H:%M" ;;
	logout ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really logout?")" = "Yes" ] && xdotool key "super+shift+q" ;; 
	reboot) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really reboot?")" = "Yes" ] && reboot  ;;
	suspend) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really suspend?")" = "Yes" ] && systemctl suspend   ;;
	hibernate ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really hibernate?")" = "Yes" ] && systemctl hibernate ;;
	shutdown) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really shutdown?")" = "Yes" ] && shutdown now ;;
	*) ;;
esac

