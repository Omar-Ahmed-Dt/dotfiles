#!/usr/bin/env bash
case $1 in
    install)
    pacman -Slq | fzf --multi --preview 'pacman -Si {1}' 
    #pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S 
    ;;
    remove)
    pacman -Qq | fzf --multi --preview 'pacman -Qi {1}'
    #pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns
    ;;
esac

