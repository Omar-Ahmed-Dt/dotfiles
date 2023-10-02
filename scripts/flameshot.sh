#!/usr/bin/env bash
#
OPT=$(echo -e "1_A_clip\n2_A_url\n3_A_save\n4_W_clip_save\n5_W_clip\n6_W_url\n7_W_save\n8_W_clip_save\n9_Full_clip\n11_Full_url\n22_Full_save\n33_Full_clip_save" | dmenu -i -p "Choose action: ")
case $OPT in
	1_A_clip ) flameshot gui -c  ;;
	2_A_url )  flameshot gui -u ;; 
	3_A_save)   flameshot gui -p ~/screenshots/  ;;
	4_A_clip_save ) flameshot gui -c -p ~/screenshots/ ;;
	5_W_clip ) flameshot gui --region $(slop -f "%wx%h+%x+%y") -c ;; 
	6_W_url ) flameshot gui --region $(slop -f "%wx%h+%x+%y") -u ;; 
    7_W_save)  flameshot gui --region $(slop -f "%wx%h+%x+%y") -p ~/screenshots/ ;; 
    8_W_clip_save )  flameshot gui --region $(slop -f "%wx%h+%x+%y") -c -p ~/screenshots/ ;; 
    9_Full_clip )   flameshot full -c ;; 
    11_Full_url )   flameshot full -u ;; 
    22_Full_save ) flameshot full -p ~/screenshots/ ;;
    33_Full_clip_save )  flameshot full -c -p ~/screenshots/ ;;
	*) ;;
esac 
