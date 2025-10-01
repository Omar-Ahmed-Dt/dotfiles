#!/bin/bash
# nnn plugin: convert selected/hovered file(s) to .mp4 via ffmpeg (no fzf)
# Usage inside nnn: ';' then your mapped key (see mapping below)
# Depends: ffmpeg, optional: notify-send

set -u

# --- helpers ---------------------------------------------------------------

have() { command -v "$1" >/dev/null 2>&1; }

notify() {
    if have notify-send; then
        notify-send "$@"
    else
        printf '%s\n' "$*" >&2
    fi
}

# Generate an output path like "name.mp4", avoiding overwrite by adding (n)
dedupe_mp4() {
    local in="$1"
    local base="${in%.*}"
    local out="${base}.mp4"
    if [ ! -e "$out" ]; then
        printf '%s\n' "$out"
        return
    fi
    local n=1
    while :; do
        out="${base} (${n}).mp4"
        [ -e "$out" ] || { printf '%s\n' "$out"; return; }
        n=$((n+1))
    done
}

convert_one() {
    local file="$1"
    if [ ! -f "$file" ]; then
        notify "Skip: not a file — $file"
        return
    fi
    local out
    out="$(dedupe_mp4 "$file")"

    # Change this line if you prefer stream copy for compatible inputs:
    # ffmpeg -y -i "$file" -c copy "$out"
    if ffmpeg -y -i "$file" "$out"; then
        notify "Converted: $(basename "$file") → $(basename "$out")"
    else
        notify "Failed converting: $(basename "$file")"
    fi
}

# --- preflight -------------------------------------------------------------

have ffmpeg || { printf 'ffmpeg not found in PATH\n' >&2; exit 1; }

# --- gather inputs from nnn ------------------------------------------------
# Priority: NNN_SEL (multi-select) > $1 (hovered file passed by nnn)
processed_any=0

if [ -n "${NNN_SEL:-}" ] && [ -s "${NNN_SEL:-}" ]; then
    # Detect if NNN_SEL is NUL-separated
    if grep -qP '\x00' "$NNN_SEL"; then
        # NUL-separated
        while IFS= read -r -d '' f; do
            convert_one "$f"
            processed_any=1
        done < "$NNN_SEL"
    else
        # Newline-separated
        while IFS= read -r f; do
            [ -n "$f" ] || continue
            convert_one "$f"
            processed_any=1
        done < "$NNN_SEL"
    fi
elif [ -n "${1:-}" ]; then
    convert_one "$1"
    processed_any=1
fi

if [ "$processed_any" -eq 0 ]; then
    notify "No selection or hovered file. Nothing to convert."
    exit 2
fi

exit 0

