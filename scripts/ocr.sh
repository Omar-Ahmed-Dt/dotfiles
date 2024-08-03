#!/bin/bash

maim -us ~/.cache/ocr/pic.png && \
tesseract -l eng ~/.cache/ocr/pic.png stdout | tr -s '\n' ' ' | sed 's/ $//' > ~/.cache/ocr/out.txt && \
xclip -sel clip ~/.cache/ocr/out.txt && \
notify-send -t 1000 'Text copied to clipboard'
