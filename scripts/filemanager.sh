#!/usr/bin/env zsh

alacritty -e zsh -c '
  [ -f ~/.nnn_env.zsh ] && source ~/.nnn_env.zsh
  nnn -Rrxl 5        # this calls the quitcd function, not just the binary
  exec zsh           # keep terminal open in the new directory
'
