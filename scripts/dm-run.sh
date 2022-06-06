#!/usr/bin/env bash
#
# Script name: dm-run
# Description: The standard dmenu_run command with flags and a prompt.
# Dependencies: dmenu
# GitLab: https://www.gitlab.com/dwt1/dmscripts
# License: https://www.gitlab.com/dwt1/dmscripts/LICENSE
# Contributors: Derek Taylor

# Set with the flags "-e", "-u","-o pipefail" cause the script to fail
# if certain things happen, which is a good thing.  Otherwise, we can
# get hidden bugs that are hard to discover.
set -euo pipefail

export _JAVA_AWT_WM_NONREPARENTING=1
exec $(dmenu_path | dmenu -l 20 -g 3 -X 0 -Y 0 -W 680 -p 'Run: ' "$@")


