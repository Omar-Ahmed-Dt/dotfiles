#!/bin/bash

# Left click
if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
  amixer -q sset Capture toggle
fi
# Middle click
# elif [[ "${BLOCK_BUTTON}" -eq 2 ]]; then
#   amixer -q sset Capture toggle
# Right click
# elif [[ "${BLOCK_BUTTON}" -eq 3 ]]; then
#   amixer -q sset Capture 5%-
# fi

statusLine=$(amixer get Capture | tail -n 1)
status=$(echo "${statusLine}" | grep -wo "on")
volume=$(echo "${statusLine}" | awk -F ' ' '{print $5}' | tr -d '[]%')

# if [[ "${status}" == "on" ]]; then
#   echo " ${volume}%"
# else
#   echo " off"
# fi

if [[ "${status}" == "on" ]]; then
  bin_color="#D2B48c"
  echo "<span color='${bin_color}'>  </span>"${volume} %
else
  bin_color="#D2B48c"
  echo "<span color='${bin_color}'>  </span>"${volume} [" OFF "]
fi
