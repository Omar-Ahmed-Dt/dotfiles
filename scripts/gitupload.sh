#!/bin/bash 
cd ~/.config/
cp -r alacritty fish neofetch ranger sxhkd zathura htop mpv paru starship.toml vlc dmscripts i3 pcmanfm yay sxiv mimeapps.list dunst polybar_bspwm bspwm /home/omar/Documents/GitHub/dotfiles/config
cd /home/omar/Documents/GitHub/dotfiles/config/dmscripts
rm dmnote
cp -r /home/omar/scripts/ /home/omar/Documents/GitHub/dotfiles/
#cp ~/.config/qutebrowser/quickmarks ~/.config/qutebrowser/config.py ~/Documents/GitHub/dotfiles/config/qutebrowser
#cp -r ~/.local/share/qutebrowser/userscripts ~/Documents/GitHub/dotfiles/config/qutebrowser/
cp ~/.config/ncmpcpp/config ~/Documents/GitHub/dotfiles/config/ncmpcpp
cp ~/.config/ncmpcpp/bindings ~/Documents/GitHub/dotfiles/config/ncmpcpp
cp ~/.config/mpd/mpd.conf ~/Documents/GitHub/dotfiles/config/mpd
#cp ~/.config/mpDris2/mpDris2.conf ~/Documents/GitHub/dotfiles/config/mpDris2
cp -r ~/.config/nnn/plugins ~/Documents/GitHub/dotfiles/config/nnn
cp -r ~/.config/kitty/kitty.conf ~/Documents/GitHub/dotfiles/config/kitty
cp -r ~/.zshrc ~/Documents/GitHub/dotfiles/zshrc
cp -r ~/.Xresources ~/Documents/GitHub/dotfiles/Xresources
cp  ~/vim_training/vim_training.ms ~/Documents/GitHub/dotfiles/vim_training.ms
cp  ~/.config/lvim/config.lua  ~/Documents/GitHub/dotfiles/config/lvim
cp -r ~/.config/lvim/ftplugin/  ~/Documents/GitHub/dotfiles/config/lvim/
cp ~/.cache/styli.sh/wallpaper.jpg ~/Documents/GitHub/dotfiles/workflow/
cp ~/.config/khal/config ~/Documents/GitHub/dotfiles/config/khal/
