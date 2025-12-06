#!/bin/bash

set -euo pipefail

# nnn sets the working directory to the one you're browsing.
dir="$PWD"

alacritty --working-directory "$dir" & disown
