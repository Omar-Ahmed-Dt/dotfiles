# Zeta theme for oh-my-zsh (modified by Omar)
# path: /home/omar/.oh-my-zsh/custom/themes/zeta.zsh-theme
# Path-only first line, ζ indicator second line.
# No username, hostname, or time.

# Colors: black|red|blue|green|yellow|magenta|cyan|white
local black=$fg[black]
local red=$fg[red]
local blue=$fg[blue]
local green=$fg[green]
local yellow=$fg[yellow]
local magenta=$fg[magenta]
local cyan=$fg[cyan]
local white=$fg[white]

local black_bold=$fg_bold[black]
local red_bold=$fg_bold[red]
local blue_bold=$fg_bold[blue]
local green_bold=$fg_bold[green]
local yellow_bold=$fg_bold[yellow]
local magenta_bold=$fg_bold[magenta]
local cyan_bold=$fg_bold[cyan]
local white_bold=$fg_bold[white]

local highlight_bg=$bg[red]

local zeta='ζ'

# Machine name (unused now, but kept if you want it later).
function get_box_name {
    if [ -f ~/.box-name ]; then
        cat ~/.box-name
    else
        echo $HOST
    fi
}

# User name (unused now, but kept if you want it later).
function get_usr_name {
    local name="%n"
    if [[ "$USER" == 'root' ]]; then
        name="%{$highlight_bg%}%{$white_bold%}$name%{$reset_color%}"
    fi
    echo $name
}

# Directory info: ~ for $HOME.
function get_current_dir {
    echo "${PWD/#$HOME/~}"
}

# Git info.
ZSH_THEME_GIT_PROMPT_PREFIX="%{$blue_bold%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$green_bold%} ✔ "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$red_bold%} ✘ "

# Git status.
ZSH_THEME_GIT_PROMPT_ADDED="%{$green_bold%}+"
ZSH_THEME_GIT_PROMPT_DELETED="%{$red_bold%}-"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$magenta_bold%}*"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$blue_bold%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$cyan_bold%}="
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$yellow_bold%}?"

# Git sha.
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="[%{$yellow%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}]"

function get_git_prompt {
    if [[ -n $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then
        local git_status="$(git_prompt_status)"
        if [[ -n $git_status ]]; then
            git_status="[$git_status%{$reset_color%}]"
        fi
        local git_prompt=" <$(git_prompt_info)$git_status>"
        echo $git_prompt
    fi
}

# (kept in case you ever want time again)
function get_time_stamp {
    echo "%*"
}

function get_space {
    local str=$1$2
    local zero='%([BSUbfksu]|([FB]|){*})'
    local len=${#${(S%%)str//$~zero/}}
    local size=$(( COLUMNS - len - 1 ))
    local space=""
    while [[ $size -gt 0 ]]; do
        space="$space "
        (( size-- ))
    done
    echo $space
}

# Prompt header:
# First line: PATH ONLY (plus git info if present).
function get_prompt_header {
    local left_prompt="%{$yellow_bold%}$(get_current_dir)%{$reset_color%}$(get_git_prompt)"
    echo "$left_prompt"
}

# Second line prompt indicator: ζ with last-exit-status color.
function get_prompt_indicator {
    if [[ $? -eq 0 ]]; then
        echo "%{$magenta_bold%}$zeta %{$reset_color%}"
    else
        echo "%{$red_bold%}$zeta %{$reset_color%}"
    fi
}

setopt prompt_subst

# Two-line prompt:
# ~/path <git-info>
# ζ
PROMPT='$(get_prompt_header)
$(get_prompt_indicator)'

# No right prompt (SHA disabled)
RPROMPT=''

# Workaround for async git handler
# https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/git.zsh#L64
local _style
if zstyle -t ':omz:alpha:lib:git' async-prompt \
  || { is-at-least 5.0.6 && zstyle -T ':omz:alpha:lib:git' async-prompt } \
  || { zstyle -s ':omz:alpha:lib:git' async-prompt _style && [[ $_style == "force" ]] }; then
    _omz_register_handler _omz_git_prompt_info
    _omz_register_handler _omz_git_prompt_status
fi

