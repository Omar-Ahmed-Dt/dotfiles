#!/bin/bash
windows=$(wmctrl -xl | grep -v " -1 " | tr -s '[:blank:]' | cut -d ' ' -f 3-3,5- | sed 's/^[a-zA-Z0-9-]*\.//' | sort | uniq)


# Add spaces to align the WM_NAMEs of the windows
max=$(echo "$windows" | awk '{cur=length($1); max=(cur>max?cur:max)} END{print max}')

windows=$(echo "$windows" | \
              awk -v max="$max" \
                  '{cur=length($1); printf $1; \
                    for(i=0; i < max - cur + 1; i++) printf " "; \
                    $1 = ""; printf "%s\n", $0}')


# target=$(echo "$windows" | dmenu  -l 40 -i -p switch: | tr -s '[:blank:]' | cut -d ' ' -f 2-)
target=$(echo "$windows" | rofi -dmenu -i -p switch: | tr -s '[:blank:]' | cut -d ' ' -f 2-)

if [[ -n $target ]]; then
    wmctrl -a "$target"
fi
