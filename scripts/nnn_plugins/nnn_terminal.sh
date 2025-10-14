#!/bin/bash

set -euo pipefail

# nnn sets the working directory to the one you're browsing.
dir="$PWD"

# Open a completely separate kitty window in that directory
kitty --directory "$dir" --detach

