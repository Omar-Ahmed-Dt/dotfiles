###
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#installation via script from github
# export ZSH="/home/$USER/.oh-my-zsh"
#installation via paru -S oh-my-zsh-git
export ZSH=/usr/share/oh-my-zsh/

#Plugins
# fzf-tab
source /usr/share/oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh
# zsh-autosuggestions
source /usr/share/oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

# Theme 
# ZSH_THEME="random"
# ZSH_THEME="af-magic"
# ZSH_THEME="nicoulaj"
# ZSH_THEME="gallifrey"
# ZSH_THEME="kennethreitz"
# ZSH_THEME="lukerandall"
# ZSH_THEME="miloshadzic"
ZSH_THEME="sorin"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# ZSH_THEME_RANDOM_IGNORED=(pygmalion tjkirch_mod)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf)

# fzf
DISABLE_FZF_AUTO_COMPLETION="false"
# Set whether to disable key bindings (CTRL-T, CTRL-R, ALT-C): 
DISABLE_FZF_KEY_BINDINGS="false"

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
# export FZF_CTRL_R_OPTS="
#   --preview 'echo {}' --preview-window up:3:hidden:wrap
#   --bind 'ctrl-/:toggle-preview'
#   --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
#   --color header:italic
#   --header 'Press CTRL-Y to copy command into clipboard'"


# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
fi

###
# vim mode 
bindkey -v 
eval "$(zoxide init zsh)"
# random color
/home/omar/github/shell-color-scripts/colorscript.sh -r 

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='lvim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
# autoload -Uz compinit
# compinit
# zstyle ':completion:*' menu select

####   ARCOLINUX SETTINGS   ####
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
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

## 

#PS1='[\u@\h \W]\$ '

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
alias pmq='pacman -Qq'
alias pmn='pacman -Q | wc -l'
alias pmc='doas pacman -Sc' #clean the cache after upgrade my system 
alias pmg='pamac-manager'
alias pmf="pacman -Qqo"
alias bs='browser-sync start --server --files "*.js, *.html, *.css"'
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
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
alias lf='lfrun'
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
alias rz="omz reload"

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

sc(){
    du -a ~/scripts/ | awk '{print $2}' | fzf --preview='head -$LINES {}'| xargs -r $EDITOR
}

se(){
    du -a ~/scripts/ | awk '{print $2}' | fzf --preview='head -$LINES {}' | xargs -r sh

}
sf(){
    fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -r -I % $EDITOR %
    # fzf --preview='head -$LINES {}'| xargs -r -I % $EDITOR % 
}


#create a file called .zshrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.

[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

#my config for nnn file manger alias nnn='nnn -eRx'
alias nn='nnn -Rxl 5'
alias n='nnn -Rxl 5'
export NNN_PLUG='F:fixname;i:imgview;f:fzcd;t:mp3conv;v:preview-tui;s:!bash -i*;o:fzopen;p:rsynccp;m:mtpmount' #to play this plug press ; then choose option 
export NNN_BMS="m:/media/;g:$HOME/Documents/GitHub;d:$HOME/Downloads/;h:~;s:~/scripts;f:~/ffmpeg;C:~/cell;w:~/wallpapers;y:~/youtube-dl;t:~/.local/share/Trash/files;S:~/screenshots;c:~/.config;p:~/pins;P:~/Pictures;M:~/Music;v:~/Videos;" #to play this plug press b then choose option 
export NNN_OPENER=nnnopen #nnnopen path : /usr/bin/nnnopen
export NNN_TMPFILE='/tmp/.lastd'
export NNN_COLORS='1267'
export NNN_FCOLORS='c1e29568E66033f7c6d6abc4'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_TRASH=1 #to use trash (needs trash-cli) instead of delete. the trash's directory : /home/omar/.local/share/Trash/files
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)"
export NNN_RCLONE='rclone mount --read-only --no-checksum'
