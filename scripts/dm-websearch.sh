#!/bin/bash

Menu="dmenu -i -c -l 5 -p"
# Menu="rofi -dmenu -i -p"

BROWSER="waterfox"

# Choose search engine (added AUR)
ENGINE=$(printf "Google\nDuckDuckGo\nStartpage\nYouTube\nAUR" | $Menu "Search engine")
[ -z "$ENGINE" ] && exit 0

# Enter search query
QUERY=$(printf "" | $Menu "Search query")
[ -z "$QUERY" ] && exit 0

# Basic URL encoding (spaces only)
ENCODED_QUERY=$(printf '%s' "$QUERY" | sed 's/ /+/g')

case "$ENGINE" in
  Google)
    URL="https://www.google.com/search?q=$ENCODED_QUERY"
    ;;
  DuckDuckGo)
    URL="https://duckduckgo.com/?q=$ENCODED_QUERY"
    ;;
  Startpage)
    URL="https://www.startpage.com/do/search?q=$ENCODED_QUERY"
    ;;
  YouTube)
    URL="https://www.youtube.com/results?search_query=$ENCODED_QUERY"
    ;;
  AUR)
    URL="https://aur.archlinux.org/packages?O=0&K=$ENCODED_QUERY"
    ;;
esac

# Launch browser (fixed your trailing &,,)
exec "$BROWSER" "$URL" >/dev/null 2>&1 &
