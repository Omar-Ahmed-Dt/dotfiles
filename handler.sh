#!/bin/bash
#
# Default acpi script that takes an entry for all actions
### Path : /etc/acpi/handler.sh
#
#
case "$1" in
    button/power)
        case "$2" in
            PBTN|PWRF)
                logger 'PowerButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    jack/headphone)
	    case "$3" in
			    plug) 
			        # To send desktop notification from a background script running as root (replace X_user and X_userid with the user and userid running X respectively): 
			        # sudo -u X_user DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/X_userid/bus notify-send 'Hello world!' 'This is an example notification.'
			        #
                    pkill -RTMIN+10 i3blocks && sudo -u omar DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus dunstify "Headphone is Plugged" -t 1500 -i /home/omar/logo/headphone2.jpg -r 9523 && pkill -RTMIN+10 i3blocks ;;
			    unplug)
                    pkill -RTMIN+10 i3blocks && sudo -u omar DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus dunstify "Headphone is Unplugged" -t 1500 -i /home/omar/logo/headphone2.jpg -r 9523 && pkill -RTMIN+10 i3blocks ;;
			    *) 
			        ;;
  		esac 
  		;;
    button/sleep)
        case "$2" in
            SLPB|SBTN)
                logger 'SleepButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000)
                        logger 'AC unpluged'
                        ;;
                    00000001)
                        logger 'AC pluged'
                        ;;
                esac
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    battery)
        case "$2" in
            BAT0)
                case "$4" in
                    00000000)
                        logger 'Battery online'
                        ;;
                    00000001)
                        logger 'Battery offline'
                        ;;
                esac
                ;;
            CPU0)
                ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac
        ;;
    button/lid)
        case "$3" in
            close)
                logger 'LID closed'
                ;;
            open)
                logger 'LID opened'
                ;;
            *)
                logger "ACPI action undefined: $3"
                ;;
    esac
    ;;
    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;

esac
