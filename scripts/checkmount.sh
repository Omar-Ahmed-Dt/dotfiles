#!/bin/bash 
#~/cell is mount point for usb  and android 
if [ "$(ls -A ~/cell)" ]; then
    [ "$(printf "No\\nYes" | dmenu -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Really Umount ?")" = "Yes" ] && sh /home/omar/scripts/dmenuumount
    #sh /home/omar/scripts/dmenuumount
else 
    [ "$(printf "No\\nYes" | dmenu -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'NotoMonoRegular:bold:pixelsize=16'  -p "Really Mount ?")" = "Yes" ] && sh /home/omar/scripts/dmenumount
    #sh /home/omar/scripts/dmenumount
fi 

