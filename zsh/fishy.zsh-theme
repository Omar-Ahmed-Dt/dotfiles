# ===============================
# Enable command substitution
# ===============================
setopt PROMPT_SUBST

# ===============================
# Fish-style collapsed path
# ===============================
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

# ===============================
# Git repo depth (.N)
# ===============================
_git_repo_depth() {
  local root cwd relpath parts
  root=$(git rev-parse --show-toplevel 2>/dev/null) || return
  cwd=$PWD
  relpath=${cwd#$root/}

  [[ "$relpath" = "$cwd" ]] && return

  parts=("${(s:/:)relpath}")
  echo ".${#parts}"
}

# ===============================
# Colors
# ===============================
local user_color='green'
[[ $UID -eq 0 ]] && user_color='red'

# ===============================
# Git prompt config (oh-my-zsh)
# ===============================
ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

# ===============================
# LEFT PROMPT
# path + depth + branch + symbol
# ===============================
PROMPT='%{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%} \
%{$fg_bold[cyan]%}$(_git_repo_depth)%{$reset_color%}\
%{$fg_bold[yellow]%}$(git_prompt_info)%{$reset_color%}\
%(!.#.>) '

# ===============================
# CONTINUATION PROMPT
# ===============================
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

# ===============================
# RIGHT PROMPT
# exit status only
# ===============================
local return_status="%{$fg_bold[red]%}%(?..%?)%{$reset_color%}"
RPROMPT='${return_status}'

