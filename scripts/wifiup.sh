#!/bin/bash

# Prints out the current up network traffic in MB

PREFIX=' '

get_up_traffic()
{
    TRANSMIT1=0
    TRANSMIT2=0
 
    IFACES=$(ip -o link show | awk -F': ' '{print $2}')
    for IFACE in $IFACES; do
        if [ $IFACE != "lo" ]; then
            TRANSMIT1=$(($(ip -s -c link show $IFACE | tail -n1 | cut -d " " -f5) + TRANSMIT1))
        fi
    done

    sleep 1

    IFACES=$(ip -o link show | awk -F': ' '{print $2}')
    for IFACE in $IFACES; do
        if [ $IFACE != "lo" ]; then
            TRANSMIT2=$(($(ip -s -c link show $IFACE | tail -n1 | cut -d " " -f5) + TRANSMIT2))
        fi
    done

    echo "$PREFIX$(expr $(expr $TRANSMIT2 - $TRANSMIT1) / 1000)KB/s"
}

get_up_traffic


