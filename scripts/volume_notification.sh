#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
    amixer -D pulse get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
    amixer -D pulse get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function send_notification {
    DIR=`dirname "$0"`
    volume=`get_volume`
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
if [ "$volume" = "0" ]; then
        icon_name="/usr/share/icons/Papirus/48x48/status/notification-audio-volume-muted.svg"
dunstify "$volume"" %   " -i "$icon_name" -h int:value:"$volume" -r 555
    else
	if [  "$volume" -lt "10" ]; then
	     icon_name="/usr/share/icons/Papirus/48x48/status/notification-audio-volume-low.svg"
dunstify "$volume"" %   " -i "$icon_name" -r 555
    else
        if [ "$volume" -lt "20" ]; then
            icon_name="/usr/share/icons/Papirus/48x48/status/notification-audio-volume-low.svg"
        else
            if [ "$volume" -lt "70" ]; then
                icon_name="/usr/share/icons/Papirus/48x48/status/notification-audio-volume-medium.svg"
            else
                icon_name="/usr/share/icons/Papirus/48x48/status/notification-audio-volume-high.svg"
            fi
        fi
    fi
fi
bar=$(seq -s "━" $(($volume/3)) | sed 's/[0-9]//g')
# Send the notification
# dunstify "$volume"" %   ""$bar" -i "$icon_name" -h int:value:"$volume" -r 555 -t 1000
dunstify "$volume"" %   " -i "$icon_name" -h int:value:"$volume" -r 555 -t 1000
}

case $1 in
    up)
	# amixer -D pulse set Master on > /dev/null
	pamixer -i 5
	send_notification
	;;
    down)
	pamixer -d 5
	send_notification
	;;
    mute)
    	# Toggle mute
	amixer -q set Master toggle
	if is_mute ; then
    DIR=`dirname "$0"`
      icon_name="/usr/share/icons/Papirus/48x48/status/notification-audio-volume-muted.svg"
      dunstify -i "$icon_name" -t 1000 -r 555 -u normal "Mute"
	else
	    send_notification
	fi
	;;
esac

