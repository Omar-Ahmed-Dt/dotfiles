#!/bin/bash

set -euo pipefail

# nnn sets the working directory to the one you're browsing.
[ -f ~/.nnn_env.zsh ] && source ~/.nnn_env.zsh
dir="$PWD"
alacritty --working-directory "$dir" & disown
