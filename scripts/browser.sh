#!/bin/bash
declare options=("Google-chrome-stable
Firefox
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
   Firefox)
       choice="firefox"
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
