#!/bin/bash

# Icons
CHARGING_ICON=''
WARNING_ICON='⚠️'
BATTERY_FULL_ICON=''
BATTERY_2_ICON=''
BATTERY_3_ICON=''
BATTERY_4_ICON=''

FULL_AT=98
BAT_ICON=""
ICON=""

get_battery() {
    # Usually only one battery exists
    remain=$(acpi | awk -F, '{print $3}' | awk -F: '{print $1":"$2}')

    if [ -d /sys/class/power_supply/BAT0 ]; then
        capacity=$(cat /sys/class/power_supply/BAT0/capacity)
        charging=$(cat /sys/class/power_supply/BAT0/status)

        # choose icon
        if [[ "$charging" == "Charging" ]]; then
            ICON="$CHARGING_ICON"
        elif [[ $capacity -le 18 ]]; then
            ICON="$WARNING_ICON"
        fi

        # choose battery icon by capacity
        if [[ $capacity -ge $FULL_AT ]]; then
            BAT_ICON="$BATTERY_FULL_ICON"
        elif [[ $capacity -le 25 ]]; then
            BAT_ICON="$BATTERY_4_ICON"
        elif [[ $capacity -le 60 ]]; then
            BAT_ICON="$BATTERY_3_ICON"
        else
            BAT_ICON="$BATTERY_2_ICON"
        fi
    fi

    echo "$ICON $BAT_ICON ${capacity}% $remain"
}

get_battery

