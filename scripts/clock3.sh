#!/bin/sh
case "$BLOCK_BUTTON" in
    1) kitty $HOME ;;
esac


clock=$(date '+%I')

case "$clock" in
	"00") icon="🕛" ;;
	"01") icon="🕐" ;;
	"02") icon="🕑" ;;
	"03") icon="🕒" ;;
	"04") icon="🕓" ;;
	"05") icon="🕔" ;;
	"06") icon="🕕" ;;
	"07") icon="🕖" ;;
	"08") icon="🕗" ;;
	"09") icon="🕘" ;;
	"10") icon="🕙" ;;
	"11") icon="🕚" ;;
	"12") icon="🕛" ;;
esac

#case $BLOCK_BUTTON in
#	1)
#		# notify-send "This Month" "$(cal --color=always | sed "s/..7m/<b><span color=\"red\">/;s/..27m/<\/span><\/b>/")"
#		notify-send "Today's date" "$(date '+%A, %d %B %Y')" 
#		notify-send "Current hour" "$(date '+%R:%S')"
#		notify-send "Yesterday's date" "$(date '+%A %d %B %y' -d 'yesterday')"
#		notify-send "Tomorrow's date" "$(date '+%A %d %B %y' -d 'tomorrow')"
#		;;
#	2) setsid -f "$TERMINAL" -e calcurse ;;
#	3) notify-send "📅 Time/date module" "\- Left click to show upcoming appointments for the next three days via \`calcurse -d3\` and show the month via \`cal\`
#- Middle click opens calcurse if installed" ;;
#	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
#esac

# echo "$(date '+%a %d %b') $icon $(date '+%I : %M %p')"
echo "$(date '+%a %d %b') 年 $(date '+%I : %M %p')"
# echo "$(date '+%a %d %b %Y') $icon $(date '+%I : %M %p')"
# echo "  $(date '+%a %d %b %Y') $icon $(date '+%I : %M %p')"
