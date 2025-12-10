#!/bin/bash 


pacman -Qeq > ~/Documents/GitHub/dotfiles/pkgs.txt
cd ~/.config/
cp -r fish neofetch sxhkd zathura htop paru dmscripts i3 pcmanfm yay sxiv mimeapps.list dunst /home/omar/Documents/GitHub/dotfiles/config
cd /home/omar/Documents/GitHub/dotfiles/config/dmscripts
rm dmnote
cp -r /home/omar/scripts/ /home/omar/Documents/GitHub/dotfiles/
cp ~/.config/ncmpcpp/config ~/Documents/GitHub/dotfiles/config/ncmpcpp
cp ~/.config/ncmpcpp/bindings ~/Documents/GitHub/dotfiles/config/ncmpcpp
cp ~/.config/mpd/mpd.conf ~/Documents/GitHub/dotfiles/config/mpd
cp -r ~/.config/kitty/kitty.conf ~/Documents/GitHub/dotfiles/config/kitty
cp -r ~/.zshrc ~/Documents/GitHub/dotfiles/zsh/zshrc
cp -r ~/.oh-my-zsh/custom/themes/zeta.zsh-theme ~/Documents/GitHub/dotfiles/zsh/
cp -r ~/.Xresources ~/Documents/GitHub/dotfiles/Xresources
cp ~/.cache/wall/wallpaper.jpg ~/Documents/GitHub/dotfiles/workflow/
cp ~/.config/khal/config ~/Documents/GitHub/dotfiles/config/khal/
cp -r ~/.config/ytfzf/* ~/Documents/GitHub/dotfiles/config/ytfzf/
cp -r ~/.config/vis/* ~/Documents/GitHub/dotfiles/config/vis/
rm ~/Documents/GitHub/dotfiles/config/vis/vis.log
cp -r /home/omar/.config/conky/ ~/Documents/GitHub/dotfiles/config/
cp ~/.config/picom.conf ~/Documents/GitHub/dotfiles/config/
cp ~/.config/mpv/mpv.conf   ~/Documents/GitHub/dotfiles/config/mpv/
cp ~/.config/mpv/input.conf ~/Documents/GitHub/dotfiles/config/mpv/
cp -r ~/.config/nvim/lua/  ~/Documents/GitHub/dotfiles/config/nvim/
cp -r ~/.config/flameshot/ ~/Documents/GitHub/dotfiles/config/ 
cp ~/github/bslock/config.def.h ~/Documents/GitHub/dotfiles/config/bslock/
# cp -r /home/omar/.config/nnn/plugins/* ~/Documents/GitHub/dotfiles/config/nnn/plugins/
cp -r /home/omar/.config/yazi/*.toml ~/Documents/GitHub/dotfiles/config/yazi/
cp -r /home/omar/.config/alacritty/*.toml ~/Documents/GitHub/dotfiles/config/alacritty/
cp -r /home/omar/.config/alacritty/custom_themes/ ~/Documents/GitHub/dotfiles/config/alacritty/
