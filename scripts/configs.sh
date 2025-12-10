#!/bin/bash
#
DMEDITOR="nvim"

actions=(configs fish zsh i3 i3blocks mpv_input mpv_config kitty alacritty alacritty_keys sxhkd sxiv zathura mimeapps tmux)

selected=$(printf '%s\n' "${actions[@]}" | dmenu -c -i -l 23 -p "Edit Configs: ")

case "$selected" in
	configs)           $DMEDITOR $HOME/scripts/configs.sh ;;
	fish)              $DMEDITOR $HOME/.config/fish/config.fish ;;
	zsh)               $DMEDITOR $HOME/.zshrc ;;
	i3)                $DMEDITOR $HOME/.config/i3/config ;;
	i3blocks)          $DMEDITOR $HOME/.config/i3/i3blocks ;;
	mpv_input)         $DMEDITOR $HOME/.config/mpv/input.conf ;;
	mpv_config)        $DMEDITOR $HOME/.config/mpv/mpv.conf ;;
	kitty)             $DMEDITOR $HOME/.config/kitty/kitty.conf ;;
	alacritty)         $DMEDITOR $HOME/.config/alacritty/alacritty.toml ;;
	alacritty_keys)    $DMEDITOR $HOME/.config/alacritty/keybindings.toml ;;
    sxhkd)             $DMEDITOR $HOME/.config/sxhkd/sxhkdrc ;;
    sxiv)              $DMEDITOR $HOME/.config/sxiv/exec/key-handler ;;
    zathura)           $DMEDITOR $HOME/.config/zathura/zathurarc ;;
    mimeapps)          $DMEDITOR $HOME/.config/mimeapps.list ;;
    tmux)              $DMEDITOR $HOME/.tmux.conf;;
esac 
