#!/bin/bash
# Default acpi script that takes an entry for all actions

### Path : /etc/acpi/handler.sh

export DISPLAY=:0.0
export $(dbus-launch)

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
                    pkill -RTMIN+10 i3blocks && sudo -u omar DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus dunstify "Headphone is Plugged" -t 1500 -i /home/omar/logo/headphone.png -r 9523 ;;
			    unplug)
                    pkill -RTMIN+10 i3blocks && sudo -u omar DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus dunstify "Headphone is Unplugged" -t 1500 -i /home/omar/logo/headphone.png -r 9523 ;;
                    #pkill -RTMIN+10 i3blocks && notify-send "Headphone is Unplugged" -r 1000 -i /home/omar/logo/headphone.png ;;
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
