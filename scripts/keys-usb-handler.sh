#!/bin/bash
# path: /usr/local/bin/keys-usb-handler.sh
systemctl start keys.service
pkill -RTMIN+10 i3blocks
