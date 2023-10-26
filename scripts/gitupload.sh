#!/bin/bash 
#
pacman -Qeq > ~/Documents/GitHub/dotfiles/pkgs.txt
cd ~/.config/
cp -r alacritty fish neofetch ranger sxhkd zathura htop mpv paru starship.toml vlc dmscripts i3 pcmanfm yay sxiv mimeapps.list dunst polybar_bspwm bspwm /home/omar/Documents/GitHub/dotfiles/config
rm ~/Documents/GitHub/dotfiles/config/i3/workspace_N.json ~/Documents/GitHub/dotfiles/config/i3/system-overview ~/Documents/GitHub/dotfiles/config/i3/start-conky-i3statusbar.sh
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
cp -r ~/.config/kitty/kitty2.conf ~/Documents/GitHub/dotfiles/config/kitty
cp -r ~/.config/kitty/theme.conf ~/Documents/GitHub/dotfiles/config/kitty
cp -r ~/.config/kitty/dracula.conf ~/Documents/GitHub/dotfiles/config/kitty/
cp -r ~/.zshrc ~/Documents/GitHub/dotfiles/zshrc
cp -r ~/.zshenv ~/Documents/GitHub/dotfiles/zshenv
cp -r ~/.Xresources ~/Documents/GitHub/dotfiles/Xresources
cp  ~/vim_training/vim_training.ms ~/Documents/GitHub/dotfiles/vim_training.ms
cp ~/.cache/wall/wallpaper.jpg ~/Documents/GitHub/dotfiles/workflow/
cp ~/.config/khal/config ~/Documents/GitHub/dotfiles/config/khal/
# cp /usr/local/searxng-docker/searxng-docker.service ~/Documents/GitHub/dotfiles/searxng/
# cp /usr/local/searxng-docker/docker-compose.yaml ~/Documents/GitHub/dotfiles/searxng/
cp -r ~/.config/lvim/* ~/Documents/GitHub/dotfiles/config/lvim/
rm ~/Documents/GitHub/dotfiles/config/lvim/lazy-lock.json
cp -r ~/.config/ytfzf/* ~/Documents/GitHub/dotfiles/config/ytfzf/
cp -r ~/.config/vis/* ~/Documents/GitHub/dotfiles/config/vis/
rm ~/Documents/GitHub/dotfiles/config/vis/vis.log
cp -r ~/.config/betterlockscreen ~/Documents/GitHub/dotfiles/config/
