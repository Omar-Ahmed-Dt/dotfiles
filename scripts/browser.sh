#!/bin/bash
declare options=("Google-chrome-stable
Brave
Waterfox
Chromium"
)

# choice=$(echo -e "${options[@]}" | dmenu -i -l 20 -g 2 -X 0 -Y 0 -W 680 -p 'launch browser: ' )
choice=$(echo -e "${options[@]}" | dmenu -i -l 4 -c -p 'launch browser: ' )

case "$choice" in 
   Waterfox)
       choice="waterfox"
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
esac
"$choice"
