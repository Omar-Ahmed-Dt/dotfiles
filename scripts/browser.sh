#!/bin/bash
declare options=("Google
Brave
Waterfox
Chromium"
)

choice=$(echo -e "${options[@]}" | dmenu -i -l 10 -c -p 'launch browser: ' )

case "$choice" in 
   Waterfox)
       choice="waterfox"
       # exec flatpak run net.waterfox.waterfox
   ;;
   Google)
       choice="google-chrome-stable"
   ;;
   Chromium)
       choice="chromium"
   ;;
    Brave) 
        exec brave --password-store=basic
    ;;
    # Firefox) 
    #     choice="firefox"
    # ;;
esac
"$choice"
