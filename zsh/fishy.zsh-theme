# --- Fish-style collapsed path ---
_fishy_collapsed_wd() {
  local i pwd
  pwd=("${(s:/:)PWD/#$HOME/~}")
  if (( $#pwd > 1 )); then
    for i in {1..$(($#pwd-1))}; do
      if [[ "$pwd[$i]" = .* ]]; then
        pwd[$i]="${${pwd[$i]}[1,2]}"
      else
        pwd[$i]="${${pwd[$i]}[1]}"
      fi
    done
  fi
  echo "${(j:/:)pwd}"
}

# --- Git depth function (shows how many directories deep you are inside repo) ---
_git_repo_depth() {
    local root cwd relpath parts
    root=$(git rev-parse --show-toplevel 2>/dev/null) || return  # not in repo
    cwd=$PWD
    relpath=${cwd#$root/}

    [[ "$relpath" = "$cwd" ]] && return  # outside repo

    parts=("${(s:/:)relpath}")
    echo ".${#parts}"   # << this makes it show like ".4"
}

# Colors (user_color still used for path color)
local user_color='green'
[ $UID -eq 0 ] && user_color='red'

# --- LEFT PROMPT (only path + git depth + symbol) ---
PROMPT='%{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%} %{$fg_bold[cyan]%}$(_git_repo_depth)%{$reset_color%}%(!.#.>) '

# --- CONTINUATION PROMPT ---
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

# --- RIGHT PROMPT (return status + git info) ---
local return_status="%{$fg_bold[red]%}%(?..%?)%{$reset_color%}"
RPROMPT='${return_status}$(git_prompt_info)$(git_prompt_status)%{$reset_color%}'

# --- Git prompt symbols ---
ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

# ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
# ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
# ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
# ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"
