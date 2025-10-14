#!/bin/bash

# Description: Opens selected images with sxiv, or all images in the current directory if none selected.
# All output and errors are suppressed.

set -euo pipefail

# Ensure sxiv exists
if ! command -v sxiv >/dev/null 2>&1; then
    exit 1
fi

declare -a files_to_open valid_files
dir="${PWD}"

# Helper: list images sorted by modification time (newest first)
list_images() {
    find -L "$dir" -maxdepth 1 -type f \
        \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \
           -o -iname '*.gif' -o -iname '*.bmp' -o -iname '*.tiff' \
           -o -iname '*.webp' -o -iname '*.svg' -o -iname '*.ico' \) \
        -printf '%T@ %p\0' 2>/dev/null |
        sort -znr |
        cut -z -d' ' -f2-
}

# If user selected files in nnn
if [[ -n "${NNN_SEL:-}" && -s "$NNN_SEL" ]]; then
    mapfile -d '' files_to_open < "$NNN_SEL"
else
    # Otherwise, open all images in current directory (sorted)
    mapfile -d '' files_to_open < <(list_images)
fi

# Filter readable files
for f in "${files_to_open[@]}"; do
    [[ -f "$f" && -r "$f" ]] && valid_files+=("$f")
done

# Exit silently if no valid images
(( ${#valid_files[@]} > 0 )) || exit 0

# Launch sxiv (via swallow if available)
if command -v swallow >/dev/null 2>&1; then
    exec swallow sxiv "${valid_files[@]}" >/dev/null 2>&1
else
    exec sxiv "${valid_files[@]}" >/dev/null 2>&1
fi

