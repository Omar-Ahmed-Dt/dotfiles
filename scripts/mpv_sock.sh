#!/bin/bash
SOCK="/tmp/mpvsocket"

if [ -S "$SOCK" ]; then
    # mpv already running, send file to it
    for f in "$@"; do
        echo '{ "command": ["loadfile", "'"$f"'", "append-play"] }' | socat - "$SOCK"
    done
else
    # start new mpv instance with IPC
    mpv --input-ipc-server="$SOCK" -- "$@"
fi

