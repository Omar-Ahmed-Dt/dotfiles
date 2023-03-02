#!/usr/bin/env bash
#
OPT=$(echo -e "A_clip\nA_url\nA_save\nW_clip_save\nW_clip\nW_url\nW_save\nW_clip_save\nFull_clip\nFull_url\nFull_save\nFull_clip_save" | dmenu -p "Choose action: ")
case $OPT in
	A_clip ) flameshot gui -c  ;;
	A_url )  flameshot gui -u ;; 
	A_save)   flameshot gui -p ~/screenshots/  ;;
	A_clip_save ) flameshot gui -c -p ~/screenshots/ ;;
	W_clip ) flameshot gui --region $(slop -f "%wx%h+%x+%y") -c ;; 
	W_url ) flameshot gui --region $(slop -f "%wx%h+%x+%y") -u ;; 
    W_save)  flameshot gui --region $(slop -f "%wx%h+%x+%y") -p ~/screenshots/ ;; 
    W_clip_save )  flameshot gui --region $(slop -f "%wx%h+%x+%y") -c -p ~/screenshots/ ;; 
    Full_clip )   flameshot full -c ;; 
    Full_url )   flameshot full -u ;; 
    Full_save ) flameshot full -p ~/screenshots/ ;;
    Full_clip_save )  flameshot full -c -p ~/screenshots/ ;;
	*) ;;
esac 
