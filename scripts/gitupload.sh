#!/bin/bash 
#
pacman -Qeq > ~/Documents/GitHub/dotfiles/pkgs.txt
cd ~/.config/
cp -r alacritty fish neofetch sxhkd zathura htop mpv paru dmscripts i3 pcmanfm yay sxiv mimeapps.list dunst /home/omar/Documents/GitHub/dotfiles/config
cd /home/omar/Documents/GitHub/dotfiles/config/dmscripts
rm dmnote
cp -r /home/omar/scripts/ /home/omar/Documents/GitHub/dotfiles/
cp ~/.config/ncmpcpp/config ~/Documents/GitHub/dotfiles/config/ncmpcpp
cp ~/.config/ncmpcpp/bindings ~/Documents/GitHub/dotfiles/config/ncmpcpp
cp ~/.config/mpd/mpd.conf ~/Documents/GitHub/dotfiles/config/mpd
cp -r ~/.config/kitty/kitty.conf ~/Documents/GitHub/dotfiles/config/kitty
cp -r ~/.zshrc ~/Documents/GitHub/dotfiles/zshrc
cp -r ~/.Xresources ~/Documents/GitHub/dotfiles/Xresources
cp  ~/vim_training/vim_training.ms ~/Documents/GitHub/dotfiles/vim_training.ms
cp ~/.cache/wall/wallpaper.jpg ~/Documents/GitHub/dotfiles/workflow/
cp ~/.config/khal/config ~/Documents/GitHub/dotfiles/config/khal/
cp -r ~/.config/lvim/* ~/Documents/GitHub/dotfiles/config/lvim/
rm ~/Documents/GitHub/dotfiles/config/lvim/lazy-lock.json
cp -r ~/.config/ytfzf/* ~/Documents/GitHub/dotfiles/config/ytfzf/
cp -r ~/.config/vis/* ~/Documents/GitHub/dotfiles/config/vis/
rm ~/Documents/GitHub/dotfiles/config/vis/vis.log
cp -r /home/omar/.config/conky/ ~/Documents/GitHub/dotfiles/config/
cp ~/.config/picom.conf ~/Documents/GitHub/dotfiles/config/
