#!/bin/bash

declare options=("Firefox
Brave
Chromium
Google-chrome")

choice=$(echo -e "${options[@]}" | dmenu -i -l 20 -g 2 -X 0 -Y 0 -W 680 -p 'launch browser: ' )

case "$choice" in 
    quit)
        echo "program terminated." && exit 1
    ;;
    Firefox)
        choice="firefox"
    ;;
    Brave)
        choice="brave"
    ;;
    Chromium)
        choice="chromium"
    ;;
    Google-chrome)
        choice="google-chrome-stable"
    ;;
esac
"$choice"
