#!/bin/bash
cd ~/youtube-dl
echo "---------------------------------------------"
echo "✘ ❯❯ $(pwd)"
echo "---------------------------------------------"
read -p '❯❯❯ Enter The Name Of File : ' name
echo "---------------------------------------------"
yt-dlp -f 'bestvideo[ext=mp4][vcodec^=avc]+bestaudio[ext=m4a]/best[ext=mp4]' \
  --merge-output-format mp4 \
  --postprocessor-args "ffmpeg:-c:v libx264 -c:a aac -movflags +faststart" \
  $(xclip -o) -o "$name.mp4" && \
  notify-send -i ~/logo/download.png -t 1000 "Download process is completed."
