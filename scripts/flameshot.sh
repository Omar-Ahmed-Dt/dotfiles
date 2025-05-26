#!/usr/bin/env bash
#
OPT=$(echo -e "1_A_clip\n2_A_save\n3_A_clip_save\n4_W_clip\n5_W_save\n6_W_clip_save\n7_Full_clip\n22_Full_save\n33_Full_clip_save" | dmenu -c -l 9 -i -p "Choose action: ")
case $OPT in
	1_A_clip ) flameshot gui -s -c  ;;
	2_A_save)   flameshot gui -s  -p ~/screenshots/  ;;
	3_A_clip_save ) flameshot gui -s -c  -p ~/screenshots/ ;;
	4_W_clip ) flameshot gui -s  --region $(slop -f "%wx%h+%x+%y") -c ;; 
    5_W_save)  flameshot gui -s  --region $(slop -f "%wx%h+%x+%y") -p ~/screenshots/ ;; 
    6_W_clip_save )  flameshot gui -s  --region $(slop -f "%wx%h+%x+%y") -c -p ~/screenshots/ ;; 
    7_Full_clip )   flameshot full  -c ;; 
    22_Full_save ) flameshot full -p ~/screenshots/ ;;
    33_Full_clip_save )  flameshot full  -c -p ~/screenshots/ ;;
	*) ;;
esac 
