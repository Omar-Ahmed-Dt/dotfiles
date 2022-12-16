#!/bin/bash
# PIDFILE="/tmp/record.pid"

# [ -s $PIDFILE ] &&  echo "[RECORDING]"
#


PIDFILE="/tmp/recordingicon"
[ -s $PIDFILE ] &&  cat /tmp/recordingicon 
