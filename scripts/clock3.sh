#!/bin/sh
case "$BLOCK_BUTTON" in
    1) kitty -e khal --color interactive ;;
    3) kitty $HOME ;;
esac


# clock=$(date '+%I')

# case "$clock" in
# 	"00") icon="🕛" ;;
# 	"01") icon="🕐" ;;
# 	"02") icon="🕑" ;;
# 	"03") icon="🕒" ;;
# 	"04") icon="🕓" ;;
# 	"05") icon="🕔" ;;
# 	"06") icon="🕕" ;;
# 	"07") icon="🕖" ;;
# 	"08") icon="🕗" ;;
# 	"09") icon="🕘" ;;
# 	"10") icon="🕙" ;;
# 	"11") icon="🕚" ;;
# 	"12") icon="🕛" ;;
# esac

echo "$(date '+%a %d %b') 年 $(date '+%I : %M %p')"
