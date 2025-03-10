#!/bin/bash
declare options=("Google-chrome-stable
Waterfox
Chromium"
)

choice=$(echo -e "${options[@]}" | dmenu -i -l 20 -g 2 -X 0 -Y 0 -W 680 -p 'launch browser: ' )

case "$choice" in 
   quit)
       echo "program terminated." && exit 1
   ;;
   # Mercury)
   #     choice="mercury-browser"
   # ;;
   Waterfox)
       choice="waterfox"
   ;;
   # Brave)
   #     choice="brave --password-store=basic"
   # ;;
   Google-chrome-stable)
       choice="google-chrome-stable"
   ;;
   Chromium)
       choice="chromium"
   ;;
esac
"$choice"
