#!/bin/bash
#date '+%Y %b %d (%a) %I:%M%p'
#date '+%d-%m-%y (%a) %I:%M%p'
#date '+%a %d-%m'

date +"%a, %B %d"| sed 's/  / /g'

#case $BLOCK_BUTTON in
#	1) pgrep -x dunst >/dev/null && notify-send "This Month" "$(cal --color=always | sedTERMINAL"s/..7m/<b><span color=\"red\">/;s/..27m/<\/span><\/b>/")" && notify-send "Appointments" "$(calcurse -D ~/.config/calcurse -d7)" ;;
#	2) setsid -f kitty -e calcurse -D ~/.config/calcurse ;;
#	3) pgrep -x dunst >/dev/null && notify-send " Time/date module" "\- Left click to show upcoming appointments for the next three days via \`calcurse -d3\` and show the month via \`cal\`
#- Middle click opens calcurse if installed" ;;
#esac
