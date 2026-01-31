#!/usr/bin/env bash

roots=(
  "$HOME"
  "/mnt"
)

find_path="$(
  find "${roots[@]}" -maxdepth 3 -type d -print \
  | sed "s|^$HOME/|HOME/|" \
  | sed "s|^/mnt/|MNT/|" \
  | dmenu -i -c -l 20
)"

if [[ -n "$find_path" ]]; then
  case "$find_path" in
    HOME/*) source ~/.nnn_env.zsh && alacritty -e nnn -rRxl 5 "$HOME/${find_path#HOME/}" ;;
    MNT/*)  source ~/.nnn_env.zsh && alacritty -e nnn -rRxl 5 "/mnt/${find_path#MNT/}" ;;
  esac
fi

exit 0
