#!/usr/bin/env bash

# Script name: _dm-helper
# Description: A helper script for the other scripts in the collection.
# Dependencies:
# GitLab: https://www.gitlab.com/dwt1/dmscripts
# License: https://www.gitlab.com/dwt1/dmscripts/LICENSE
# Contributors: Simon Ingelsson
#               HostGrady
#               aryak1

set -euo pipefail

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "This is a helper-script it does not do anything on its own."
    exit 1
fi

######################
#   Error handling   #
######################

# Simple warn function
warn() {
    printf 'Warn: %s\n' "$1"
}

# Simple error function
err() {
    printf 'Error: %s\n' "$1"
    exit 1
}

############################
#   Dislay server checks   #
############################

# Boiler code for if you want to do something with display servers

#function() {
#  case "$XDG_SESSION_TYPE" in
#    'x11') something with x;;
#    'wayland') something with wayland;;
#    *) err "Unknown display server";;
#  esac
#}

# Function to copy to clipboard with different tools depending on the display server
cp2cb() {
    case "$XDG_SESSION_TYPE" in
    'x11') xclip -r -selection clipboard ;;
    'wayland') wl-copy -n ;;
    *) err "Unknown display server" ;;
    esac
}

grep-desktop() {
    case "$XDG_SESSION_TYPE" in
    'x11') grep "Name=" /usr/share/xsessions/*.desktop | cut -d'=' -f2 ;;
    'wayland') grep "Name=" /usr/share/wayland-sessions/*.desktop | cut -d'=' -f2 || grep "Name=" /usr/share/xsessions/*.desktop | grep -i "wayland" | cut -d'=' -f2 | cut -d' ' -f1 ;;
    *) err "Unknown display server" ;;
    esac
}

###############
#   Parsing   #
###############

# simple function which provides a key-value pair in the form of the DM_XML_TAG and DM_XML_VALUE varaibles
xmlgetnext() {
    local IFS='>'
    # we need to mangle backslashes for this to work (SC2162)
    # The DM_XML_* variables are global variables and are expected to be read and dealt with by someone else (SC2034)
    # shellcheck disable=SC2162,SC2034
    read -d '<' DM_XML_TAG DM_XML_VALUE
}

#################
# Help Function #
#################

# Every script has a '-h' option that displays the following information.
help() {
    printf '%s%s%s\n' "Usage: $(basename "$0") [options]
$(grep '^# Description: ' "$0" | sed 's/# Description: /Description: /g')
$(grep '^# Dependencies: ' "$0" | sed 's/# Dependencies: /Dependencies: /g')

The folowing OPTIONS are accepted:
    -h  displays this help page
    -d  runs the script using 'dmenu'
    -f  runs the script using 'fzf'
    -r  runs the script using 'rofi'

Running" " $(basename "$0") " "without any argument defaults to using 'dmenu'
Run 'man dmscripts' for more information" >/dev/stderr
}

####################
# Handle Arguments #
####################

# this function is a simple parser designed to get the menu program and then exit prematurally
get_menu_program() {
    # If script is run with '-d', it will use 'dmenu'
    # If script is run with '-f', it will use 'fzf'
    # If script is run with '-r', it will use 'rofi'
    while getopts "dfrh" arg 2>/dev/null; do
        case "${arg}" in
        d) # shellcheck disable=SC2153
            echo "${DMENU}"
            return 0
            ;;
        f) # shellcheck disable=SC2153
            echo "${FMENU}"
            return 0
            ;;
        r) # shellcheck disable=SC2153
            echo "${RMENU}"
            return 0
            ;;
        h)
            help
            return 1
            ;;
        *)
            echo "invalid option:
Type $(basename "$0") -h for help" >/dev/stderr
            return 1
            ;;
        esac
    done
    echo "Did not find menu argument, using \${DMENU}" >/dev/stderr
    # shellcheck disable=SC2153
    echo "${DMENU}"
}

####################
# Boilerplate Code #
####################

# this function will source the dmscripts config files in the order specified below:
#
# Config priority (in order of which code takes precendent over the other):
# 1. Git repository config - For developers
# 2. $XDG_CONFIG_HOME/dmscripts/config || $HOME/.config/dmscripts/config - For local edits
# 3. /etc/dmscripts/config - For the gloabl/default configuration
#
# Only 1 file is ever sourced

# this warning is simply not necessary anywhere in the scope
# shellcheck disable=SC1091
source_dmscripts_configs() {
    # this is to ensure this variable is defined
    XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-}"

    [ -f "../config/config" ] && source "../config/config" && return 0
    [ -z "$XDG_CONFIG_HOME" ] && [ -f "$HOME/.config/dmscripts/config" ] && source "$HOME/.config/dmscripts/config" && return 0
    [ -n "$XDG_CONFIG_HOME" ] && [ -f "$XDG_CONFIG_HOME/dmscripts/config" ] && source "$XDG_CONFIG_HOME/dmscripts/config" && return 0
    [ -f "/etc/dmscripts/config" ] && source "/etc/dmscripts/config"
}

# checks the base configuration file and compares it with the local configuration file
# if the numbers are different then the code will return 0, else 1
#
# this does not check the git config as it doesn't make sense
configs_are_different() {
    local _base_file=""
    local _config_file=""

    # DM_SHUTUP is a variable in the dmscript config that is intended to silence the notifications.
    DM_SHUTUP="${DM_SHUTUP:-}"

    # it cannot determine if the files are different if it does not exist
    [ -f "/etc/dmscripts/config" ] && _base_file="/etc/dmscripts/config" || return 1

    # this is essentially the same idea as seen previous just with different variable names
    local _xdg_config_home="${XDG_CONFIG_HOME:-}"

    [ -z "$_xdg_config_home" ] && [ -f "$HOME/.config/dmscripts/config" ] && _config_file="$HOME/.config/dmscripts/config"
    [ -n "$_xdg_config_home" ] && [ -f "$XDG_CONFIG_HOME/dmscripts/config" ] && _config_file="$XDG_CONFIG_HOME/dmscripts/config"

    # if there is no other config files then just exit.
    [ -z "$_config_file" ] && return 1

    _config_file_revision=$(grep "^_revision=" "${_config_file}")
    _base_file_revision=$(grep "^_revision=" "${_base_file}")

    if [[ ! "${_config_file_revision}" == "${_base_file_revision}" ]]; then
        if [ -z "$DM_SHUTUP" ]; then
            notify-send "dmscripts configuration outdated" "Review the differences of /etc/dmscripts/config and your local config and apply changes accordingly (dont forget to bump the revision number)"
        fi
        return 0
    fi

    return 1
}
