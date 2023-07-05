#!/bin/bash
#
# generate bash script in $pwd
path=$(pwd)
script_path="$path"

# the editor of your choice
script_editor="lvim"

# check for argument (script name)

script_file="$script_path/$1"

if [[ -z "$@" ]]; then
    echo -e "\n\nError!\nUsage: ssgen script_name\n\n"
    exit 0;
fi

# if script doesn't exist, create it

if [[ ! -f $script_file ]]; then
    echo '#!/bin/bash' > $script_file
    # echo '#!/bin/bash' > $script_file
    chmod +744 $script_file
fi

# open script with editor

eval $script_editor $script_file

exit 0
