#!/bin/sh
case "$BLOCK_BUTTON" in
    1) kitty -e khal --color interactive ;;
    3) kitty $HOME ;;
esac

clock=$(date '+%I')

case "$clock" in
    "00") icon="N" ;;  # N for zero (nulla in Latin)
    "01") icon="I" ;;  # One
    "02") icon="II" ;; # Two
    "03") icon="III" ;;# Three
    "04") icon="IV" ;; # Four
    "05") icon="V" ;;  # Five
    "06") icon="VI" ;; # Six
    "07") icon="VII" ;;# Seven
    "08") icon="VIII";;# Eight
    "09") icon="IX" ;; # Nine
    "10") icon="X" ;;  # Ten
    "11") icon="XI" ;; # Eleven
    "12") icon="XII" ;;# Twelve
esac

echo "$(date '+%a %d %b') $icon $(date '+%I:%M %p')"

