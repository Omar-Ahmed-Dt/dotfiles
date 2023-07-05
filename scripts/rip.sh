#!/bin/sh

# dig +short myip.opendns.com @resolver1.opendns.com

myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
echo "My WAN/Public IP address: ${myip}"

# ip=$(curl -s icanhazip.com);

# if [[ "$BLOCK_BUTTON" -eq 1 ]];
# then
# 	netname=$(whois $ip | grep '^netname:' | awk '{print $2}' | tail -1);
# 	echo "$netname"
# else
# 	echo "$ip"
# fi
