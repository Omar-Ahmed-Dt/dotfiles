#!/bin/bash
declare options=("Google-chrome-stable
Brave
Waterfox
Chromium
Thorium
Firefox"
)

# choice=$(echo -e "${options[@]}" | dmenu -i -l 20 -g 2 -X 0 -Y 0 -W 680 -p 'launch browser: ' )
choice=$(echo -e "${options[@]}" | dmenu -i -l 20 -c -p 'launch browser: ' )

case "$choice" in 
   Waterfox)
       choice="waterfox"
       # exec flatpak run net.waterfox.waterfox
   ;;
   Google-chrome-stable)
       choice="google-chrome-stable"
   ;;
   Chromium)
       choice="chromium"
   ;;
    Brave) 
        exec brave --password-store=basic
    ;;
    Thorium) 
        choice="thorium-browser"
    ;;
    Firefox) 
        choice="firefox"
    ;;
esac
"$choice"
