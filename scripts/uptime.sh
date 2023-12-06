#! /bin/bash 
uptime -p | sed 's/days/d/' | sed 's/hours/h/' | sed 's/minutes/m/' | sed 's/up/UP/'
