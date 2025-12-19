#!/bin/bash

Menu="dmenu -i -c -l 5 -p" 
# Menu="rofi -dmenu -i -p"

BROWSER="firefox"

# Choose search engine
ENGINE=$(printf "Google\nDuckDuckGo\nStartpage\nYouTube" | $Menu "Search engine")
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
esac

exec "$BROWSER" "$URL" >/dev/null 2>&1 &
