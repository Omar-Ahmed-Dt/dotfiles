#!/bin/sh

# bytes (B):
update() {
    sum=0
    for arg; do
        read -r i < "$arg"
        sum=$(( sum + i ))
    done
    cache=${XDG_CACHE_HOME:-$HOME/.cache}/${1##*/}
    [ -f "$cache" ] && read -r old < "$cache" || old=0
    printf %d\\n "$sum" > "$cache"
    printf %d\\n $(( sum - old ))
}

rx=$(update /sys/class/net/[ew]*/statistics/rx_bytes)
tx=$(update /sys/class/net/[ew]*/statistics/tx_bytes)

printf "  %3sB - %3sB\\n" $(numfmt --to=iec $rx) $(numfmt --to=iec $tx)

# bits (bps):
# update() {
#     sum=0
#     for arg; do
#         read -r i < "$arg"
#         sum=$(( sum + i ))
#     done
#     cache=${XDG_CACHE_HOME:-$HOME/.cache}/${1##*/}
#     [ -f "$cache" ] && read -r old < "$cache" || old=0
#     printf %d\\n "$sum" > "$cache"
#     printf %d\\n $(( (sum - old) * 8 ))  # Multiply by 8 to convert bytes to bits
# }
#
# rx=$(update /sys/class/net/[ew]*/statistics/rx_bytes)
# tx=$(update /sys/class/net/[ew]*/statistics/tx_bytes)
#
# printf "  %3sbps - %3sbps\\n" $(numfmt --to=iec $rx) $(numfmt --to=iec $tx)
