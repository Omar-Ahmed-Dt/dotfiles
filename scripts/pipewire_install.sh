#!/bin/bash
#
sudo pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber helvum
#sudo pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber qpwgraph
systemctl --user enable --now pipewire.service
systemctl --user enable --now pipewire.socket
systemctl --user enable --now pipewire-pulse.socket
systemctl --user enable --now wireplumber.service
sudo systemctl disable --global pipewire

