#!/bin/bash

# Choose a program from PATH
prog=$(dmenu_path | dmenu -p "Choose a program to toggle:")

# Exit if nothing selected
[ -z "$prog" ] && exit

# Check if the program is running
if pgrep -f "$prog"; then
    # If running, ask to kill
    choice=$(printf "Yes\nNo" | dmenu -p "$prog is running. Kill it?")
    if [ "$choice" = "Yes" ]; then
        # killall "$prog"
        pkill -f "$prog"
    fi
else
    # If not running, ask to start
    # choice=$(printf "Yes\nNo" | dmenu -p "$prog is not running. Start it?")
    # if [ "$choice" = "Yes" ]; then
        "$prog" &
    # fi
fi
