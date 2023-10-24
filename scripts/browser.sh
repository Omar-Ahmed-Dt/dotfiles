#!/bin/bash
declare options=("Firefox
Brave
Google-chrome-stable
Chromium"
)

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
   Google-chrome-stable)
       choice="google-chrome-stable"
   ;;
   Chromium)
       choice="chromium"
   ;;
esac
"$choice"

# declare options=("Thorium
# Firefox
# Brave
# Google-chrome-stable
# Chromium"
# )

# choice=$(echo -e "${options[@]}" | dmenu -i -l 20 -g 2 -X 0 -Y 0 -W 680 -p 'launch browser: ' )

# case "$choice" in 
#     quit)
#         echo "program terminated." && exit 1
#     ;;
#     Thorium)
#         choice="thorium-browser"
#     ;;
#     Firefox)
#         choice="firefox"
#     ;;
#     Brave)
#         choice="brave"
#     ;;
#     Google-chrome-stable)
#         choice="google-chrome-stable"
#     ;;
#     Chromium)
#         choice="chromium"
#     ;;
# esac
# "$choice"
