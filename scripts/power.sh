#!/bin/bash
OPT=$(echo -e "lock\nlogout\nreboot\nsuspend\nshutdown" | dmenu -i -p "Choose action: ")
case $OPT in
	# lock ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really lock?")" = "Yes" ] && ~/scripts/lock.sh && pkill -RTMIN+20 i3blocks ;;
	lock ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really lock?")" = "Yes" ] && betterlockscreen -l dim && pkill -RTMIN+20 i3blocks ;;
	logout ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really logout?")" = "Yes" ] && pkill i3 ;; 
	reboot) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really reboot?")" = "Yes" ] && reboot  ;;
	suspend) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really suspend?")" = "Yes" ] && systemctl suspend  ;;
	shutdown) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really shutdown?")" = "Yes" ] && shutdown now ;;
	*) ;;
esac
