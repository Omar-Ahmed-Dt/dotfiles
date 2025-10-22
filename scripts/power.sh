#!/bin/bash

# Menu options
# OPTIONS="lock\nexit\nreboot\nhibernate\nzzz\nshutdown"
OPTIONS="lock\nhibernate\nreboot\nexit\nzzz\nshutdown"

# Prompt user (centered and vertical)
OPT=$(echo -e "$OPTIONS" | dmenu -i -c -l 6 -p "Choose action:")

# Confirmation function
confirm() {
    printf "No\nYes" | dmenu -i -c -l 2 -p "Really $1?"
}

# Action handler
case "$OPT" in
    lock)
        [ "$(confirm lock)" = "Yes" ] && ~/scripts/lock.sh && pkill -RTMIN+20 i3blocks
        ;;
    exit)
        [ "$(confirm exit)" = "Yes" ] && pkill i3
        ;;
    reboot)
        [ "$(confirm reboot)" = "Yes" ] && reboot -i
        ;;
    hibernate)
        if [ "$(confirm hibernate)" = "Yes" ]; then
            setxkbmap us && pkill -RTMIN+15 i3blocks && bslock systemctl hibernate
        fi
        ;;
    zzz)
        if [ "$(confirm suspend)" = "Yes" ]; then
            setxkbmap us && pkill -RTMIN+15 i3blocks && bslock systemctl suspend -i 
        fi
        ;;
    shutdown)
        [ "$(confirm shutdown)" = "Yes" ] && shutdown now
        ;;
    *)
        ;;
esac

