#!/bin/bash

USER="omar"
USER_ID=1000
PULSE_RUNTIME_PATH="/run/user/$USER_ID/pulse/"
DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$USER_ID/bus"
DISPLAY=":0"

# Function to send notification
send_notification() {
    local message="$1"
    local icon="$2"
    sudo -u "$USER" DISPLAY="$DISPLAY" DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" dunstify "$message" -t 1500 -i "$icon" -r 9523
}

# Function to run i3blocks update
update_i3blocks() {
    pkill -RTMIN+10 i3blocks
}

case "$1" in
    button/lid)
        case "$3" in
            close)
                sudo -u "$USER" DISPLAY="$DISPLAY" DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" /home/omar/scripts/lock.sh 
                sudo -u "$USER" DISPLAY="$DISPLAY" DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" systemctl suspend
                ;;
            open)
                logger 'LID opened'
                ;;
        esac
        ;;
    jack/headphone)
        case "$3" in
            plug)
                update_i3blocks
                send_notification "Headphone is Plugged" "/home/omar/logo/headphone2.jpg"
                sudo -u "$USER" PULSE_RUNTIME_PATH="$PULSE_RUNTIME_PATH" DISPLAY="$DISPLAY" DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" /home/omar/scripts/headphone_plugin.sh
                ;;
            unplug)
                update_i3blocks
                send_notification "Headphone is Unplugged" "/home/omar/logo/headphone2.jpg"
                ;;
        esac
        ;;
esac

