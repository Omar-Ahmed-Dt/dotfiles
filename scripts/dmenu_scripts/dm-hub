#!/usr/bin/env bash
#
# Script name: dm-hub
# Description: A hub allowing you to execute all the other dmscripts.
# Dependencies: dmenu, fzf, rofi
# GitLab: https://www.gitlab.com/dwt1/dmscripts
# License: https://www.gitlab.com/dwt1/dmscripts/LICENSE
# Contributors: n-e0
#               Simon Ingelsson
#               Derek Taylor

# Set with the flags "-e", "-u","-o pipefail" cause the script to fail
# if certain things happen, which is a good thing.  Otherwise, we can
# get hidden bugs that are hard to discover.
set -euo pipefail

_path=$(dirname "$(realpath "$0")")

# shellcheck disable=SC1091
source ./_dm-helper.sh 2>/dev/null || source _dm-helper.sh 2>/dev/null

source_dmscripts_configs

if configs_are_different; then
    echo "$(date): configs are different" >>"$DM_CONFIG_DIFF_LOGFILE"
    sleep 1
fi

function maindmenu() {
    local _self
    declare -A _scripts

    _self=$(basename "$0")

    while IFS= read -r -d '' script; do
        # Every 'dmscript' should contain a line that begins with "# Description: ".
        # Let's take that description and add it next to the script name in the dmenu.
        script_name=$(echo "$(basename "${script}") $(grep '^# Description: ' "${script}")" | sed 's/# Description: /- /g')
        [[ "${script_name}" == "${_self}" ]] && continue
        _scripts[${script_name}]="${script}"
    done < <(find "${_path}" -type f -regex ".*/dm-.*" -print0)

    choice=$(printf '%s\n' "${!_scripts[@]}" | sort | grep ".*dm.*" | ${DMENU} 'Run Script:' "$@")

    if [ "${choice}" ]; then
        thecommand="$(printf '%s' "${_scripts["${choice}"]}" | awk '{print $1}')"
        bash "$thecommand" -d "$@"
    else
        echo "Program terminated." && exit 0
    fi
}

function mainfzf() {
    local _self
    declare -A _scripts

    _self=$(basename "$0")

    while IFS= read -r -d '' script; do
        # Every 'dmscript' should contain a line that begins with "# Description: ".
        # Let's take that description and add it next to the script name in the dmenu.
        script_name=$(echo "$(basename "${script}") $(grep '^# Description: ' "${script}")" | sed 's/# Description: /- /g')
        [[ "${script_name}" == "${_self}" ]] && continue
        _scripts[${script_name}]="${script}"
    done < <(find "${_path}" -type f -regex ".*/dm-.*" -print0)

    choice=$(printf '%s\n' "${!_scripts[@]}" | sort | grep ".*dm.*" | ${FMENU} 'Run Script:')

    if [ "${choice}" ]; then
        thecommand="$(printf '%s' "${_scripts["${choice}"]}" | awk '{print $1}')"
        bash "$thecommand" -f
    else
        echo "Program terminated." && exit 0
    fi
}

function mainrofi() {
    local _self
    declare -A _scripts

    _self=$(basename "$0")

    while IFS= read -r -d '' script; do
        # Every 'dmscript' should contain a line that begins with "# Description: ".
        # Let's take that description and add it next to the script name in the dmenu.
        script_name=$(echo "$(basename "${script}") $(grep '^# Description: ' "${script}")" | sed 's/# Description: /- /g')
        [[ "${script_name}" == "${_self}" ]] && continue
        _scripts[${script_name}]="${script}"
    done < <(find "${_path}" -type f -regex ".*/dm-.*" -print0)

    choice=$(printf '%s\n' "${!_scripts[@]}" | sort | grep ".*dm.*" | ${RMENU} 'Run Script:' "$@")

    if [ "${choice}" ]; then
        thecommand="$(printf '%s' "${_scripts["${choice}"]}" | awk '{print $1}')"
        bash "$thecommand" -r "$@"
    else
        echo "Program terminated." && exit 0
    fi
}

no_opt=1
# If script is run with '-d', it will use 'dmenu'
# If script is run with '-f', it will use 'fzf'
# If script is run with '-d', it will use 'rofi'
while getopts "dfrh" arg 2>/dev/null; do
    case "${arg}" in
    d) [[ "${BASH_SOURCE[0]}" == "${0}" ]] && maindmenu ;;
    f) [[ "${BASH_SOURCE[0]}" == "${0}" ]] && mainfzf ;;
    r) [[ "${BASH_SOURCE[0]}" == "${0}" ]] && mainrofi "$@" ;;
    h) help ;;
    *) printf '%s\n' "Error: invalid option" "Type $(basename "$0") -h for help" ;;
    esac
    no_opt=0
done

# If script is run with NO argument, it will use 'dmenu'
[ $no_opt = 1 ] && [[ "${BASH_SOURCE[0]}" == "${0}" ]] && maindmenu "$@"

# TODO: for some reason dm-template is broken with this script, needs investigating
