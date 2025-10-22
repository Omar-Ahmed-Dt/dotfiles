#!/bin/bash

AUDIO_INTERVAL=1
LONG_FORMAT=1
SHORT_FORMAT=0
USE_PERCENT=1
USE_ALSA_NAME=0
USE_DESCRIPTION=1

while getopts F:f:pdT:t:i:h opt; do
  case "$opt" in
    F) LONG_FORMAT="$OPTARG" ;;
    f) SHORT_FORMAT="$OPTARG" ;;
    p) USE_PERCENT=0 ;;
    d) USE_DESCRIPTION=1 ;;
    T) AUDIO_MED_THRESH="$OPTARG" ;;
    t) AUDIO_LOW_THRESH="$OPTARG" ;;
    i) AUDIO_INTERVAL="$OPTARG" ;;
    h) printf "help" ;;
  esac
done

toggle_mute() { pamixer --toggle-mute; }

switch_output() {
  current_sink=$(pactl info | awk -F': ' '/Default Sink/{print $2}')
  mapfile -t sinks < <(pactl list short sinks | awk '{print $2}')
  ((${#sinks[@]}==0)) && exit 0

  next_sink="${sinks[0]}"
  for i in "${!sinks[@]}"; do
    if [[ "${sinks[$i]}" == "$current_sink" ]]; then
      next_sink="${sinks[$(((i+1)%${#sinks[@]}))]}"
      break
    fi
  done

  pactl set-default-sink "$next_sink"
  pactl list short sink-inputs | while read -r line; do
    sid=$(awk '{print $1}' <<<"$line")
    pactl move-sink-input "$sid" "$next_sink"
  done
}

print_format() {
  [[ $USE_PERCENT == 0 ]] && PERCENT=""
  case "$1" in
    1) echo "$VOL$PERCENT [$NAME]" ;;
    2) echo "$VOL$PERCENT [$INDEX]" ;;
    3) echo "$VOL$PERCENT" ;;
    *) echo "$VOL$PERCENT [$INDEX:$NAME]" ;;
  esac
}

print_block() {
  # Exact default sink name (e.g. alsa_output.pci-0000_00_1f.3.analog-stereo)
  SINK_NAME=$(pactl info | awk -F': ' '/Default Sink/{print $2}')

  # Single index from the short list (one line per sink)
  INDEX=$(pactl list short sinks | awk -v n="$SINK_NAME" '$2==n{print $1; exit}')

  # Description from the exact sink block
  DESCRIPTION=$(pactl list sinks | awk -v n="$SINK_NAME" '
    /^Sink #/ {inblk=0}
    $0 ~ "Name: " n {inblk=1}
    inblk && /Description:/ {sub(/^.*Description: /,""); print; exit}
  ')

  # Decide display NAME
  NAME="$SINK_NAME"
  if [[ $USE_DESCRIPTION == 1 && -n "$DESCRIPTION" ]]; then
    case "$DESCRIPTION" in
      *Headset*) NAME="Headset" ;;
      *Built-in*) NAME="Built-in" ;;
      *HDMI*) NAME="HDMI" ;;
      *) NAME=$(awk '{print $1, $2}' <<<"$DESCRIPTION") ;;
    esac
  fi

  # Always numeric volume; never use --get-volume-human (it prints "muted")
  VOL_NUM=$(pamixer --get-volume 2>/dev/null || echo 0)
  if [[ $USE_PERCENT == 1 ]]; then
    VOL="${VOL_NUM}%"
  else
    VOL="$VOL_NUM"
  fi

  # Append mute status but keep number
  if pamixer --get-mute | grep -q true; then
    VOL="${VOL} (muted)"   # or: VOL="${VOL} 🔇"
  fi

  print_format "$LONG_FORMAT"
  if [[ $SUBSCRIBE != 1 ]]; then
    print_format "$SHORT_FORMAT"
  fi
}

case "$BLOCK_BUTTON" in
  1) toggle_mute ;;   # Left click → toggle mute
  3) switch_output ;; # Right click → switch output
esac

print_block
