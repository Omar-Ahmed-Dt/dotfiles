#!/bin/bash
#
DMEDITOR="nvim"

actions=(configs fish i3 i3_blocks mpv_input mpv_config kitty sxhkd sxiv zathura mimeapps tmux)

selected=$(printf '%s\n' "${actions[@]}" | dmenu -c -i -l 20 -p "Edit Configs: ")

case "$selected" in
	configs)           $DMEDITOR $HOME/scripts/configs.sh ;;
	fish)              $DMEDITOR $HOME/.config/fish/config.fish ;;
	i3)                $DMEDITOR $HOME/.config/i3/config ;;
	i3_blocks)         $DMEDITOR $HOME/.config/i3/i3blocks ;;
	mpv_input)         $DMEDITOR $HOME/.config/mpv/input.conf ;;
	mpv_config)        $DMEDITOR $HOME/.config/mpv/mpv.conf ;;
	kitty)             $DMEDITOR $HOME/.config/kitty/kitty.conf ;;
    sxhkd)             $DMEDITOR $HOME/.config/sxhkd/sxhkdrc ;;
    sxiv)              $DMEDITOR $HOME/.config/sxiv/exec/key-handler ;;
    zathura)           $DMEDITOR $HOME/.config/zathura/zathurarc ;;
    mimeapps)          $DMEDITOR $HOME/.config/mimeapps.list ;;
    tmux)              $DMEDITOR $HOME/.tmux.conf;;
esac 
