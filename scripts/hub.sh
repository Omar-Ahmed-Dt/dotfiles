#!/bin/bash 

cd ~/scripts/dmenu_scripts/
lsd --ignore-glob="_dm-helper.sh" | dmenu -l 5 -p "Choose Script: "| xargs /bin/bash 2> /dev/null
