#!/bin/bash
OPT=$(echo -e "lock\nkill\nreboot\nzzz\nshutdown" | dmenu -i -p "Choose action: ")
case $OPT in
	lock ) [ "$(printf "No\\nYes" | dmenu -i -p "Really lock?")" = "Yes" ] && ~/scripts/lock.sh && pkill -RTMIN+20 i3blocks ;;
	kill ) [ "$(printf "No\\nYes" | dmenu -i -p "Really exit?")" = "Yes" ] && pkill i3 ;; 
	reboot) [ "$(printf "No\\nYes" | dmenu -i -p "Really reboot?")" = "Yes" ] && reboot -i ;;
	# zzz) [ "$(printf "No\\nYes" | dmenu -i -p "Really suspend?")" = "Yes" ] && ~/scripts/lock.sh && systemctl suspend ;;
	zzz) [ "$(printf "No\\nYes" | dmenu -i -p "Really suspend?")" = "Yes" ] && slock systemctl suspend -i ;;
	shutdown) [ "$(printf "No\\nYes" | dmenu -i -p "Really shutdown?")" = "Yes" ] && shutdown now ;;
	*) ;;
esac
