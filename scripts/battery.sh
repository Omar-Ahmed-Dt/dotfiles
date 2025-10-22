#!/bin/bash

# Gruvbox colors
FG="#ebdbb2"
RED="#fb4934"
ORANGE="#fe8019"
YELLOW="#fabd2f"
GREEN="#b8bb26"
AQUA="#8ec07c"
BLUE="#83a598"
PURPLE="#d3869b"

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
            ICON="<span foreground=\"$YELLOW\">$CHARGING_ICON</span>"
        elif [[ $capacity -le 18 ]]; then
            ICON="<span foreground=\"$RED\">$WARNING_ICON</span>"
        fi

        # choose battery icon by capacity
        if [[ $capacity -ge $FULL_AT ]]; then
            BAT_ICON="<span foreground=\"$GREEN\">$BATTERY_FULL_ICON</span>"
        elif [[ $capacity -le 25 ]]; then
            BAT_ICON="<span foreground=\"$RED\">$BATTERY_4_ICON</span>"
        elif [[ $capacity -le 60 ]]; then
            BAT_ICON="<span foreground=\"$ORANGE\">$BATTERY_3_ICON</span>"
        else
            BAT_ICON="<span foreground=\"$YELLOW\">$BATTERY_2_ICON</span>"
        fi
    fi

    echo "$ICON $BAT_ICON <span foreground=\"$FG\">${capacity}% $remain</span>"
}

get_battery

