#!/bin/sh
# nnn plugin: open Thunar in the current directory

dir="$PWD"           # nnn exports the pane's directory as $PWD
setsid thunar "$dir" >/dev/null 2>&1 &
exit 0
