#!/bin/bash

# Menu options
OPTIONS="lock\nkill\nreboot\nzzz\nshutdown"

# Prompt user (centered and vertical)
OPT=$(echo -e "$OPTIONS" | dmenu -i -c -l 5 -p "Choose action:")

# Confirmation function
confirm() {
    printf "No\nYes" | dmenu -i -c -l 2 -p "Really $1?"
}

# Action handler
case "$OPT" in
    lock)
        [ "$(confirm lock)" = "Yes" ] && ~/scripts/lock.sh && pkill -RTMIN+20 i3blocks
        ;;
    kill)
        [ "$(confirm exit)" = "Yes" ] && pkill i3
        ;;
    reboot)
        [ "$(confirm reboot)" = "Yes" ] && reboot -i
        ;;
    zzz)
        if [ "$(confirm suspend)" = "Yes" ]; then
            ~/scripts/lock.sh
            systemctl suspend -i
        fi
        ;;
    shutdown)
        [ "$(confirm shutdown)" = "Yes" ] && shutdown now
        ;;
    *)
        ;;
esac

