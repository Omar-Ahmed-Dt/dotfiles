#!/bin/bash
#!/usr/bin/bash

LANGUAGE=$(printf "eng\nara" | dmenu -i -p "Choose language: ") && maim -us ~/.cache/ocr/pic.png && tesseract -l $LANGUAGE  ~/.cache/ocr/pic.png ~/.cache/ocr/out && xclip -sel clip ~/.cache/ocr/out.txt && notify-send -t 1500 'text copied to clipboard'
