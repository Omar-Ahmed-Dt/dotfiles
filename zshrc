###
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#installation via script from github
# export ZSH="/home/$USER/.oh-my-zsh"
#installation via paru -S oh-my-zsh-git
export ZSH=/usr/share/oh-my-zsh/

#Plugins
plugins_path="/usr/share/oh-my-zsh/custom/plugins"
# fzf-tab
source $plugins_path/fzf-tab/fzf-tab.plugin.zsh
# zsh-autosuggestions
source $plugins_path/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
# vim mode 
set -o vi
# source $plugins_path/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Theme 
# ZSH_THEME="random"
# ZSH_THEME="gallifrey"
ZSH_THEME="sorin"
# ZSH_THEME="apple"
# ZSH_THEME="awesomepanda"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git fzf vi-mode)
plugins=(git fzf colored-man-pages)

# fzf
DISABLE_FZF_AUTO_COMPLETION="false"
# Set whether to disable key bindings (CTRL-T, CTRL-R, ALT-C): 
DISABLE_FZF_KEY_BINDINGS="false"

# Preview file content using bat (https://github.com/sharkdp/bat)
# export FZF_CTRL_T_OPTS="
#   --preview 'bat -n --color=always {}'
#   --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
fi

###
# vim mode 
# bindkey -v 
#
# zoxide
eval "$(zoxide init zsh)"
# Random Color
/home/omar/github/shell-color-scripts/colorscript.sh -r 
# echo $(date "+%a %d.%m.%Y %H:%M %p") | ponysay

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

####   ARCOLINUX SETTINGS   ####
# Colored man pages
function man() {
	env \
		LESS_TERMCAP_md=$(tput bold; tput setaf 4) \
		LESS_TERMCAP_me=$(tput sgr0) \
		LESS_TERMCAP_mb=$(tput blink) \
		LESS_TERMCAP_us=$(tput setaf 2) \
		LESS_TERMCAP_ue=$(tput sgr0) \
		LESS_TERMCAP_so=$(tput smso) \
		LESS_TERMCAP_se=$(tput rmso) \
		PAGER="${commands[less]:-$PAGER}" \
		man "$@"
}
export PAGER='bat --theme=1337 -l man -p'
# export PAGER='bat --theme gruvbox-dark -l  man -p'
# export PAGER='bat'
# export PAGER='most'

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

setopt GLOB_DOTS
#share commands between terminal instances or not
unsetopt SHARE_HISTORY
#setopt SHARE_HISTORY

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

# EXPORT
export EDITOR='lvim'
export VISUAL='lvim'
export TERMINAL='kitty'
## 

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

### ALIASES ###
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias hw="hwinfo --short"
alias update-fc='sudo fc-cache -fv'
alias p='cd ..'
alias C='doas chmod 777'
alias c='doas chmod 744'
alias do='doas'
alias pmi='doas pacman -S'
alias pmu='doas pacman -Syyu'
alias pmuu='paru -Syu'
alias pmr='doas pacman -Rs'
alias pmR='doas pacman -Rd --nodeps' #remove pkg without dependencies
alias pmii='paru -S'
alias pmq='pacman -Q'
alias pmqd='pacman -Qqs'
alias pmn='pacman -Q | wc -l'
alias pmc='doas pacman -Sc' #clean the cache after upgrade my system 
alias pmg='pamac-manager'
alias pmf="pacman -Qqo"
alias bs='browser-sync start --server --files "*.js, *.html, *.css"'
alias e='exit'
alias tomp3='sh ~/scripts/tomp3.sh'
alias install='makepkg -si'
alias md='mkdir'
alias config='/home/omar/scripts/configs.sh'
alias blk='lsblk'
alias img='~/scripts/sxivall1.sh'
alias imgall='~/scripts/sxivall2.sh'
alias gc='cd ~/.config'
alias cdi='cd ~/.config/i3'
alias ram='ps axh -o cmd:15,%mem --sort=-%mem | head | string trim'
alias cpu='ps axh -o cmd:15,%cpu --sort=-%cpu | head'
alias bup='sh /home/omar/scripts/gitupload.sh'
alias df='duf'
alias dfdr='dust'
alias dfd='dust -r'
alias printer='system-config-printer'
alias printerinstall='hp-setup -u'
alias epdf='okular'
alias topdf='sh ~/scripts/topdf.sh'
alias gn='cd ~/.config/nnn'
alias tl='trash-list' 
alias tr='trash-restore'
alias gt='cd ~/.local/share/Trash/files'
alias te='trash-empty'
alias gs='cd ~/scripts'
alias pr='proxychains'
alias pf='proxychains firefox'
alias toand='sh ~/scripts/android.sh'
alias N='prime-run'
alias m='~/scripts/matrix.sh'
alias gx='cd /usr/share/xsessions'
alias ft='xdg-mime query filetype'
alias fd='xdg-mime query default'
alias search='find / -iname'
alias rip='~/scripts/rip.sh'
alias ip='ip --color a'
alias ll='lsd -lh'
alias la="lsd -lah"
alias l="lsd"
alias ls="lsd"
alias llp="lsd -lh --permission octal"
alias lls="lsd -lhS"
alias llt="lsd -lht"
alias llS="lsd -l --total-size 2> /dev/null"
alias calc='gnome-calculator'
alias smus='mpd && ncmpcpp'
alias mus='ncmpcpp'
alias emus='pkill mpd'
alias rd='zaread'
alias size='du -sh'
alias gm='cd /media'
alias code='vscodium'
alias gsh="~/scripts/gsh.sh"
alias theme="~/scripts/kitty_theme.sh"
alias f="doas find / -iname"
alias uprsc="xrdb -load ~/.Xresources"
alias gpu="sudo lvim /etc/optimus-manager/optimus-manager.conf"
alias smi="nvidia-smi"
alias ct="kitty +kitten themes"
alias journ="journalctl -f"
alias note="io.github.lainsce.Notejot"
alias rm="rm -i"
alias V="sudoedit"
alias rkeys="~/scripts/keys.sh"
alias rmpm="sudo rm /var/lib/pacman/db.lck"
alias cd="z"
alias opdf="~/scripts/ozathura.sh"
alias ompv="~/scripts/ompv.sh"
alias cat="lolcat"
alias gd="cd ~/Documents/GitHub/"
alias sv="~/scripts/dmenu_service.sh"
alias V="doas lvim $argv"
alias v="lvim $argv"
# alias rzsh="omz reload"
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"
alias prop="xprop | grep WM_CLASS"
# alias lf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -r -I % $EDITOR %"
bindkey -s '^o' 'lf\n'

# alias funcitons 
nls() {
    ls -l $(nnn -p -)
}

nto(){
    nnn -p - | xargs $argv 2> /dev/null
}

keys(){
    xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}

hub(){
    cd /home/omar/github/dmscripts/scripts/
    ./dm-hub
}

pmsi(){
    ~/scripts/pms.sh install | xargs -ro sudo pacman -S
}

pmsii(){
    yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk "{print \$2}")' | xargs -ro  yay -S
}

pmsr(){
    ~/scripts/pms.sh remove | xargs -ro sudo pacman -Rns
}

# sc(){
#     cd ~/scripts
#     du -a ~/scripts/ | awk '{print $2}' | fzf --preview='head -$LINES {}'| xargs -r $EDITOR
#     cd - 
# }

se(){
    cd ~/scripts
    fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -r sh 
    cd -

}
sc(){
    cd ~/scripts
    fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -r -I % $EDITOR %
    cd -
}

#create a file called .zshrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.

[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

# nnn configurations : 
# ~/.zshenv
# The plugin will auto execute this zvm_after_select_vi_mode function
# Change cursor shape for different vi modes.
