#!/bin/bash
cd ~/youtube-dl
echo "---------------------------------------------"
echo "✘ ❯❯ $(pwd)"
echo "---------------------------------------------"
read -p '❯❯❯ Enter The Name Of File : ' name
echo "---------------------------------------------"
youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $(xclip -o) -o "$name.mp4" && notify-send -i ~/logo/download.png "Download process is completed." 
