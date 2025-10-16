#!/bin/bash
# nnn plugin: send hovered/selected files to ripdrag (multi-file)
# Depends: ripdrag (https://github.com/nikolausm/ripdrag)

set -euo pipefail

# Launch ripdrag in background so nnn isn't blocked
run_ripdrag() {
    nohup ripdrag "$@" >/dev/null 2>&1 &
    disown
}

# Check dependency
if ! command -v ripdrag >/dev/null 2>&1; then
    echo "ripdrag not found in PATH" >&2
    exit 1
fi

# Use multi-selection file if available
if [[ -n "${NNN_SEL:-}" && -s "$NNN_SEL" ]]; then
    if grep -qU $'\x00' "$NNN_SEL"; then
        # NUL-separated list
        xargs -0 -a "$NNN_SEL" ripdrag >/dev/null 2>&1 &
        disown
    else
        # Newline-separated
        mapfile -t files < "$NNN_SEL"
        run_ripdrag "${files[@]}"
    fi
elif [[ -n "${1:-}" ]]; then
    # Single hovered file fallback
    run_ripdrag "$1"
else
    echo "No selection or hovered file found." >&2
    exit 2
fi

