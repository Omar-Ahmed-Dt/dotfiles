#!/bin/bash
#
STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null)
if [ -z "$STATUS" ]; then
    echo " --%"
    exit 0
fi

VOLUME=$(echo "$STATUS" | awk '{print int($2 * 100)}')
MUTED=$(echo "$STATUS" | grep -q "MUTED" && echo 1 || echo 0)

if [ "$MUTED" -eq 1 ]; then
    ICON=""
    echo "$ICON MUTED ($VOLUME%)"
elif [ "$VOLUME" -eq 0 ]; then
    ICON=""
    echo "$ICON $VOLUME%"
elif [ "$VOLUME" -lt 50 ]; then
    ICON=""
    echo "$ICON $VOLUME%"
else
    ICON=""
    echo "$ICON $VOLUME%"
fi
