#! /bin/bash 
uptime -p | sed 's/hour/h/' | sed 's/minutes/m/'
