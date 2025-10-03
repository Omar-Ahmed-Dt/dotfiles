#!/bin/bash

# Opens selected images with sxiv, or all images if none selected
# All output and errors are suppressed

# Check sxiv silently
if ! command -v sxiv >/dev/null 2>&1; then
    exit 1
fi

declare -a files_to_open

# Handle selection (NUL-separated)
if [[ -n "${NNN_SEL:-}" ]] && [[ -s "$NNN_SEL" ]]; then
    mapfile -d '' files_to_open < "$NNN_SEL"
else
    # No selection: get all images (case-insensitive)
    shopt -s nullglob
    files_to_open=(
        *.jpg *.jpeg *.png *.gif *.bmp *.tiff *.webp *.svg *.ico \
        *.JPG *.JPEG *.PNG *.GIF *.BMP *.TIFF *.WEBP *.SVG *.ICO
    )
    shopt -u nullglob
fi

# Filter valid, readable files
valid_files=()
for f in "${files_to_open[@]}"; do
    [[ -f "$f" ]] && [[ -r "$f" ]] && valid_files+=("$f")
done

# Exit silently if no valid files
(( ${#valid_files[@]} > 0 )) || exit 0

# Launch sxiv with all valid files (no output)
exec swallow sxiv "${valid_files[@]}" >/dev/null 2>&1
