#!/bin/bash
# echo $(date "+%a %d.%m.%Y %H:%M %p") | ponysay

/home/omar/github/shell-color-scripts/colorscript.sh -r 
# neofetch 
cd ~/youtube-dl 
echo "---------------------------------------------"
echo "✘ ❯❯ $(pwd)"
echo "---------------------------------------------"
read -p '❯❯❯ Enter The Name Of File : ' name 
echo "---------------------------------------------"
yt-dlp --extract-audio --audio-format mp3 $(xclip -o) -o "$name".mp3 && notify-send -i ~/logo/download.png "Download process is completed." 
