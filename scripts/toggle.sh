#!/bin/bash
pgrep -f $1 && killall $1 || $1
