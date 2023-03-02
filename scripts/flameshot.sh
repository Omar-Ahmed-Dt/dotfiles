#!/usr/bin/env bash
#
OPT=$(echo -e "A_clip\nA_save\nA_both\nW_clip\nW_save\nFull_clip\nFull_save\nFull_both" | dmenu -p "Choose action: ")
case $OPT in
	A_clip ) flameshot gui -c  ;;
	A_save)   flameshot gui -p ~/screenshots/  ;;
	A_both ) flameshot gui -c -p ~/screenshots/ ;;
	W_clip ) maim -i $(xdotool getactivewindow) | xclip -selection clipboard -i -t image/png   && notify-send -i ~/logo/screen.png "Screenshot taken" ;;
    W_save) maim -i $(xdotool getactivewindow) ~/screenshots/$(date +'%Y%m%d-%H%M%S').png && notify-send -i ~/logo/screen.png "Screenshot taken" ;;
    Full_clip )   flameshot full -c ;; 
    Full_save ) flameshot full -p ~/screenshots/ ;;
    Full_both )  flameshot full -c -p ~/screenshots/ ;;
	*) ;;
esac 
