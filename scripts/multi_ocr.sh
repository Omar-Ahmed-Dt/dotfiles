#!/bin/bash

# Choose language using dmenu
LANG=$(echo -e "eng\nara" | dmenu -p "Choose OCR language:")

# Exit if no selection is made
if [ -z "$LANG" ]; then
  notify-send -t 1000 'No language selected. Exiting.'
  exit 1
fi

# Path to the image
IMAGE_PATH=~/.cache/ocr/pic.png

# Perform OCR using the chosen language
maim -us $IMAGE_PATH && \
tesseract -l $LANG $IMAGE_PATH stdout | tr -s '\n' ' ' | sed 's/ $//' > ~/.cache/ocr/out.txt && \
xclip -sel clip ~/.cache/ocr/out.txt && \
notify-send -t 1000 'Text copied to clipboard'
