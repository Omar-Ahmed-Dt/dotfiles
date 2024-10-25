#!/bin/bash
OPT=$(echo -e "lock\nexit\nreboot\nsuspend\nshutdown" | dmenu -i -p "Choose action: ")
case $OPT in
	lock ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really lock?")" = "Yes" ] && ~/scripts/lock.sh && pkill -RTMIN+20 i3blocks ;;
	# lock ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really lock?")" = "Yes" ] && betterlockscreen -l dim && pkill -RTMIN+20 i3blocks ;;
	exit ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really exit?")" = "Yes" ] && pkill i3 ;; 
	reboot) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really reboot?")" = "Yes" ] && reboot  ;;
	suspend) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really suspend?")" = "Yes" ] && ~/scripts/lock.sh && systemctl suspend ;;
	# suspend) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really suspend?")" = "Yes" ] && ~/scripts/lock.sh && systemctl hybrid-sleep ;;
	shutdown) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really shutdown?")" = "Yes" ] && shutdown now ;;
	*) ;;
esac
