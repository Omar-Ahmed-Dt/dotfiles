#!/bin/bash
set -e

# DMENU="dmenu -i -l 5 -p"
DMENU="dmenu -i -c -l 3 -p" 
BROWSER="firefox"

# Choose search engine
ENGINE=$(printf "Google\nDuckDuckGo\nStartpage" | $DMENU "Search engine:")
[ -z "$ENGINE" ] && exit 0

# Enter search query
QUERY=$(printf "" | $DMENU "Search query:")
[ -z "$QUERY" ] && exit 0

# URL encode (basic)
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
esac

exec "$BROWSER" "$URL" >/dev/null 2>&1 &

