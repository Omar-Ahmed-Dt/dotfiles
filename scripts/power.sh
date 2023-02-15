#!/bin/bash
# OPT=$(echo -e "lock\nlogout\nreboot\nsuspend\nhibernate\nshutdown" | dmenu  -p "Choose action: ")
OPT=$(echo -e "lock\nlogout\nreboot\nsuspend\nshutdown" | dmenu -p "Choose action: ")
case $OPT in
	# lock ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really lock?")" = "Yes" ] && betterlockscreen -l dimblur -- --time-str="%d %b (%a) %I:%M%p" ;;
	# lock ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really lock?")" = "Yes" ] && bslock ;;
	# lock ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really lock?")" = "Yes" ] && xfce4-screensaver-command -l ;;
	# lock ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really lock?")" = "Yes" ] && ~/scripts/lock.sh && light -S 5 && pkill -RTMIN+20 i3blocks ;;
	lock ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really lock?")" = "Yes" ] && ~/scripts/lock.sh && pkill -RTMIN+20 i3blocks ;;
	# logout ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really logout?")" = "Yes" ] && xdotool key "super+shift+q" ;; 
	logout ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really logout?")" = "Yes" ] && pkill i3 ;; 
	reboot) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really reboot?")" = "Yes" ] && reboot  ;;
	suspend) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really suspend?")" = "Yes" ] && ~/scripts/lock.sh && systemctl suspend   ;;
	# hibernate ) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really hibernate?")" = "Yes" ] && systemctl hibernate ;;
	shutdown) [ "$(printf "No\\nYes" | dmenu -i -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really shutdown?")" = "Yes" ] && shutdown now ;;
	*) ;;
esac

