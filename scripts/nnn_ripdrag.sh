#!/bin/bash
# nnn plugin: send hovered/selected files to ripdrag
# Depends: ripdrag (https://github.com/nikolausm/ripdrag)

set -euo pipefail

# Helper: launch ripdrag in background so nnn isn't blocked
run_ripdrag() {
    # shellcheck disable=SC2068
    ripdrag $@ >/dev/null 2>&1 &
    disown
}

# Check dependency
command -v ripdrag >/dev/null 2>&1 || {
    printf "ripdrag not found in PATH\n" >&2
    exit 1
}

# Prefer multi-selection (NNN_SEL) if present & non-empty; else use hovered file ($1)
if [ -n "${NNN_SEL:-}" ] && [ -s "$NNN_SEL" ]; then
    # NNN_SEL can be newline- or NUL-separated depending on nnn config.
    # Detect NUL; if found, use -0; otherwise treat as newline-separated.
    if grep -qP '\x00' "$NNN_SEL"; then
        # NUL-separated
        xargs -0 -a "$NNN_SEL" ripdrag >/dev/null 2>&1 &
        disown
    else
        # Newline-separated (best-effort)
        mapfile -t files < "$NNN_SEL"
        # If any lines are empty, remove them
        files=("${files[@]/#/}")
        # Run
        run_ripdrag -- "${files[@]}"
    fi
elif [ -n "${1:-}" ]; then
    # Fallback: hovered entry path passed by nnn as $1
    run_ripdrag -- "$1"
else
    printf "No selection and no hovered file provided.\n" >&2
    exit 2
fi

