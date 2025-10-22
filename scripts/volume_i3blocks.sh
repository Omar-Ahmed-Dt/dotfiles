#!/bin/bash
# i3blocks volume indicator using wpctl (PipeWire)
# Supports mouse control: 
# 1=next sink, 2=mute toggle, 3=previous sink, 4=vol+, 5=vol-

# --- Configurable symbols ---
ICON_LOW=""
ICON_MED=""
ICON_HIGH=""

AUDIO_DELTA=5  # volume step percentage

# --- Functions ---

# Switch all streams to new default
# move_streams_to_new_default() {
#     DEFAULT_SINK=$1
#     for STREAM in $(wpctl status | awk '/Output/ && /→/ {print $1}' | sed 's/.*\.//'); do
#         wpctl move @DEFAULT_AUDIO_SINK@ "$DEFAULT_SINK" >/dev/null 2>&1
#     done
# }
#
# # Cycle sinks forward/backward
# set_default_playback_device_next() {
#     inc=${1:-1}
#     mapfile -t sinks < <(wpctl status | grep -A10 "Sinks:" | grep -E "^[ \t]*[0-9]+" | awk '{print $1}')
#     current=$(wpctl status | grep "Default Sink" | awk '{print $3}' | tr -d '.')
#     num=${#sinks[@]}
#
#     # Find current sink index
#     for i in "${!sinks[@]}"; do
#         if [[ "${sinks[$i]}" == "$current" ]]; then
#             index=$i
#             break
#         fi
#     done
#
#     # Compute next index
#     next_index=$(( (index + num + inc) % num ))
#     next_sink=${sinks[$next_index]}
#     wpctl set-default "$next_sink"
#     move_streams_to_new_default "$next_sink"
# }
#
# # --- Mouse input handling ---
# case "$BLOCK_BUTTON" in
#     1) set_default_playback_device_next 1 ;;   # Left click → next sink
#     3) set_default_playback_device_next -1 ;;  # Right click → previous sink
# esac

# --- Display status ---
STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null)
if [ -z "$STATUS" ]; then
    echo "$ICON_LOW --%"
    exit 0
fi

VOLUME=$(echo "$STATUS" | awk '{print int($2 * 100)}')
MUTED=$(echo "$STATUS" | grep -q "MUTED" && echo 1 || echo 0)

if [ "$MUTED" -eq 1 ]; then
    # ICON="$ICON_LOW"
    # echo "$ICON MUTED ($VOLUME%)"
    echo "MUTED ($VOLUME%)"
elif [ "$VOLUME" -eq 0 ]; then
    # ICON="$ICON_LOW"
    # echo "$ICON $VOLUME%"
    echo "$VOLUME%"
elif [ "$VOLUME" -lt 50 ]; then
    # ICON="$ICON_MED"
    # echo "$ICON $VOLUME%"
    echo "$VOLUME%"
else
    # ICON="$ICON_HIGH"
    # echo "$ICON $VOLUME%"
    echo "$VOLUME%"
fi

