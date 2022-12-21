#!/bin/sh
# TERMINAL=kitty

# case $BLOCK_BUTTON in
# 		1) setsid -f "$TERMINAL" -e pulsemixer ;;
# 		2) pamixer -t ;;
# 		4) pamixer --allow-boost -i 5 ;;
# 		5) pamixer --allow-boost -d 5 ;;
# 		3) notify-send "📢 Volume module" "\- Shows volume 🔊, 🔇 if muted.
# 		- Middle click to mute.
# 		- Scroll to change." ;;
# 		6) "$TERMINAL" -e "$EDITOR" "$0" ;;
# 	esac

vol="$(pamixer --get-volume)"
[ $(pamixer --get-mute) = true ] && echo 🔇 "$vol%" && exit

# vol="$(pamixer --get-volume)"

if [ "$vol" -gt "70" ]; then
		icon="🔊"
	elif [ "$vol" -gt "30" ]; then
			icon="🔉"
		elif [ "$vol" -gt "0" ]; then
				icon="🔈"
			else
				        echo 🔇 "$vol" [unknown] && exit
fi

echo "$icon$vol%"
