#!/bin/bash
OPT=$(echo -e "lock\nexit\nreboot\nsuspend\nshutdown" | dmenu -i -p "Choose action: ")
case $OPT in
	lock ) [ "$(printf "No\\nYes" | dmenu -i -p "Really lock?")" = "Yes" ] && ~/scripts/lock.sh && pkill -RTMIN+20 i3blocks ;;
	exit ) [ "$(printf "No\\nYes" | dmenu -i -p "Really exit?")" = "Yes" ] && pkill i3 ;; 
	reboot) [ "$(printf "No\\nYes" | dmenu -i -p "Really reboot?")" = "Yes" ] && reboot  ;;
	suspend) [ "$(printf "No\\nYes" | dmenu -i -p "Really suspend?")" = "Yes" ] && ~/scripts/lock.sh && systemctl suspend ;;
	shutdown) [ "$(printf "No\\nYes" | dmenu -i -p "Really shutdown?")" = "Yes" ] && shutdown now ;;
	*) ;;
esac
