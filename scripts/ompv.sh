#!/bin/bash
tg="$(find -iname '*.mp4' -or -iname '*.mkv' -or -iname '*.mp3'| fzf )"
#tg="$(find -iname '*.mp4' -or -iname '*.mkv' -or -iname '*.mp3'| fzf )"
if [ -z "$tg" ]
then
      echo "!!"
else
       mpv "$tg" & disown > /dev/null 2>&1 
fi
