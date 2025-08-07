## Gruvbox Theme:
# options: dark {soft , medium , hard} | light {soft, medium, hard}
# theme_gruvbox dark soft

# the current promp theme: omf theme >> clearance

function fish_greeting
     $HOME/github/shell-color-scripts/colorscript.sh -r 
     # pokemon-colorscripts --no-title -r -b
end

# :)
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_visual block

# goLang Config
# set -Ux PATH $PATH $HOME/go/bin

# xterm: 
# set -x TERM xterm-256color
##
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths


### EXPORT ###
set TERMINAL "kitty"                         # Sets the terminal type
set EDITOR   "nvim"
set VISUAL   "nvim"
set -x BROWSER waterfox

### "bat" as manpager
# set -x MANPAGER "sh -c 'bat --theme gruvbox-dark -l man'"

# Set fzf defaults
# set FZF_DEFAULT_OPTS "--layout=reverse --border=bold --border=rounded --margin=3% --color=dark"
# fzf --fish | source

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  fish_vi_key_bindings
end

alias clear='echo -en "\x1b[2J\x1b[1;1H" ; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'
alias cl='clear'
# bind ctrl+l :  
# function fish_user_key_bindings
#     bind -M insert \cl 'clear; commandline -f execute'    # Bind Ctrl + L to clear and press enter in insert mode
    # bind -M insert \cl 'clear'    # Bind Ctrl + L to clear and press enter in insert mode
#     bind -M default \cl 'clear'   # Bind Ctrl + L to clear and press enter in normal mode
# end

# navigation
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias jctl="journalctl -e"

# switch between shells
# I do not recommend switching default SHELL from bash.
alias tobash="doas chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="doas chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="doas chsh $USER -s /bin/fish && echo 'Now log out.'"

#my config 
# alias p='cd ..'
alias X='doas chmod 777'
alias x='doas chmod 744'
alias do='doas'


alias pmi='doas pacman -S'
alias pmu='doas pacman -Syyu'
alias pmuu='paru -Syu'
alias pmo='doas pacman -Sy'
alias pmr='doas pacman -Rs'
alias pmR='doas pacman -Rd --nodeps' #remove pkg without dependencies
alias pmii='paru -S'
alias pmq='pacman -Q'
alias pmqf="expac --timefmt='%Y-%m-%d %H:%M:%S' '%l %n %v' | sort -r | fzf"
alias pmqt="expac --timefmt='%Y-%m-%d %H:%M:%S' '%l %n %v' | sort -r"
alias pmn='pacman -Q | wc -l'
alias pmc='doas pacman -Sc' #clean the cache after upgrade my system 
# alias pmg='pamac-manager'
# alias pmf="pacman -Qqo"
alias md='mkdir'
alias config='/home/omar/scripts/configs.sh'
alias gc='cd ~/.config'
alias ram='ps axh -o cmd:15,%mem --sort=-%mem | head | string trim'
alias cpu='ps axh -o cmd:15,%cpu --sort=-%cpu | head'
alias bup='sh /home/omar/scripts/gitupload.sh'
# alias df='duf -hide special -style ascii'
alias df='dysk -c fs+type+size+used+free+use+mp'
alias dfdr='dust'
alias dfd='dust -r'
alias printer='system-config-printer'
alias printerinstall='hp-setup -u'
alias epdf='okular'
alias gt='cd ~/.local/share/Trash/files'
alias gs='cd ~/scripts'
# alias pr='proxychains'
# alias pf='proxychains firefox'
# alias toand='sh ~/scripts/android.sh'
alias m='~/scripts/matrix.sh'
alias gx='cd /usr/share/xsessions'
alias ft='xdg-mime query filetype'
alias fd='xdg-mime query default'
alias rip='~/scripts/rip.sh' #to get public ip 
# alias ip='ip --color' #to get private ip 
# alias ll='lsd -lh --icon-theme unicode'
# alias la="lsd -lah --icon-theme unicode"
# alias l="lsd --icon-theme unicode"
# alias ls="lsd --icon-theme unicode"
# alias llp="lsd -lh --permission octal --icon-theme unicode"
# alias lls="lsd -lhS --icon-theme unicode"
# alias llt="lsd -lht --icon-theme unicode"
# alias llS="lsd -l --total-size 2> /dev/null --icon-theme unicode"
alias ll='lsd -lh'
alias la="lsd -lah"
alias l="lsd"
alias ls="lsd"
alias llp="lsd -lh --permission octal"
alias lls="lsd -lhS"
alias llt="lsd -lht"
alias llS="lsd -l --total-size 2> /dev/null"
alias gcalc='gnome-calculator'
alias calc='kalker'
alias gm='cd /mnt'
alias code='vscodium'
alias gsh="~/scripts/gsh.sh"
# alias uprsc="xrdb -load ~/.Xresources"
# alias gpu="doas nvim /etc/optimus-manager/optimus-manager.conf"
alias ns="nvidia-smi"
alias nr="prime-run"
alias theme="kitty +kitten themes"
alias note="io.github.lainsce.Notejot"
# alias rm="rm -i"
# alias V="doasedit"
alias rf='source ~/.config/fish/config.fish'
alias rkeys="~/scripts/keys.sh"
alias rmpm="doas rm /var/lib/pacman/db.lck"
alias cd="z" # zoxide pkg
alias cat="lolcat"
alias prop="xprop | grep WM_CLASS"
alias dl="~/scripts/dlfile.sh"
alias dlmv="~/scripts/mvdragon.sh"
alias dlcp="~/scripts/cpdrag.sh"
alias ytm="ytfzf --pages=2 -m -t -l -s"
alias ytv="ytfzf --pages=2 -t -l -s"
alias phn="~/scripts/scrcpy.sh"
alias pipes="pipes.sh"
# alias ssh="kitty +kitten ssh"
alias st="speedtest-cli --simple --secure"
alias stm="nload -u m -m wlp3s0"
alias win="~/scripts/windows.sh"
alias swm="~/scripts/switch.sh"
alias mega="megabasterd"
alias clock="tty-clock -xscbt"
alias ping="ping -c 20"
alias dr='~/scripts/dr.sh'
alias mm='~/scripts/mount_manager.sh'
alias chmm='~/scripts/kill_mnt_processes.sh'
alias topdf='~/scripts/extract_pages.sh'
alias gif='~/scripts/gif.sh'
alias bat='bat --theme gruvbox-dark'
alias rm='trash-put -ir'
alias rmPrm='trash-empty -vi'
alias dbls='~/scripts/dbdb.sh'
alias db='~/scripts/dbrowse.sh'
alias khal='khal calendar'
alias chft='kitty +list-fonts | grep "Source Code Pro"'
alias k='kubectl'
alias h='helm'
alias tg='tgpt'
alias dp='dropbox start -i'
# alias mpv='prime-run mpv'
alias mx='ncpamixer -t i'
alias gv='cd .config/nvim'
alias gg='git-graph' # and install git-delta
# alias tgl='~/scripts/toggle.sh'
alias sx="ls -1t --classic | xargs swallow sxiv 2> /dev/null"
alias yx="yt-x"
alias tf="terraform"
alias glow='glow -l'

function se
    cd ~/scripts
    fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -r sh 
    cd -
end 

function nls
  ls -l $(nnn -p -)
end 

function nto 
  nnn -p - | xargs $argv 2> /dev/null
end
  

function keys
  xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
end 

function sv 
    ~/scripts/dmenu_service.sh
end 

function gd 
  cd ~/Documents/GitHub/
end 

function hub 
    cd /home/omar/github/dmscripts/scripts/
    ./dm-hub
end
#search pkg with packman and install it 
function pmsi
    pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro doas pacman -S
end
#search pkg with yay and install it 
function pmsii 
    paru -Slq | fzf -m --preview 'paru -Si {1}' | xargs -ro paru -S
end 
#search pkg and remove it 
function pmsr
    pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro doas pacman -Rns
end
#search in scripts and open it 
function sc
    cd ~/scripts/
    fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -r -I % $EDITOR %
    cd - 
end 
# excution selected script 
function se
    cd ~/scripts/
    fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -r /bin/bash
    cd - 
end 

# alias to nvim 
function v
    nvim $argv
end

function V
    sudo -E nvim $argv
end

function vi 
    vim $argv 
end 

# function lk
#   set loc (walk --icons $argv); and cd $loc;
# end

function f 
    doas find / -iname $argv 2> /dev/null | grep $argv
end

####################################
####################################
#cd any directory by alias sd 
function sd -d "Change directory"
    set -l commandline (__fzf_parse_commandline)
    set -l dir $commandline[1]
    set -l fzf_query $commandline[2]

    if not type -q argparse
        # Fallback for fish shell version < 2.7
        function argparse
            functions -e argparse # deletes itself
        end
        if contains -- --hidden $argv; or contains -- -h $argv
            set _flag_hidden "yes"
        end
    end

    # Fish shell version >= v2.7, use argparse
    set -l options  "h/hidden"
    argparse $options -- $argv

    set -l COMMAND

    set -q FZF_CD_COMMAND
    or set -l FZF_CD_COMMAND "
    command find -L \$dir -mindepth 1 \\( -path \$dir'*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
    -o -type d -print 2> /dev/null | sed 's@^\./@@'"

    set -q FZF_CD_WITH_HIDDEN_COMMAND
    or set -l FZF_CD_WITH_HIDDEN_COMMAND "
    command find -L \$dir \
    \\( -path '*/\\.git*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | sed 1d | cut -b3-"

    if set -q _flag_hidden
        set COMMAND $FZF_CD_WITH_HIDDEN_COMMAND
    else
        set COMMAND $FZF_CD_COMMAND
    end

    eval "$COMMAND | "(__fzfcmd)" +m $FZF_DEFAULT_OPTS $FZF_CD_OPTS --query \"$fzf_query\"" | read -l select

    if not test -z "$select"
        builtin cd "$select"

        # Remove last token from commandline.
        commandline -t ""
    end

    commandline -f repaint
end
# nnn configs
alias nn='nnn -Rrxl 5' 
alias n='nnn -rRxl 5'
export NNN_PLUG='C:!magick "$nnn" png:- | xclip -sel clipboard -t image/png*;u:upload;f:fixname;i:imgview;t:mp3conv;v:preview-tui;s:!fish -i*;p:rsynccp;n:nmount;z:autojump;d:~/scripts/dr.sh;c:~/scripts/tomp4.sh'
export NNN_BMS="a:$HOME/home_docker/metube/videos;r:$HOME/rnote;m:/mnt/;g:$HOME/Documents/GitHub;D:$HOME/Documents/;d:$HOME/Downloads/;h:~;s:~/scripts;f:~/ffmpeg;C:~/cell;w:~/wallpapers;y:~/youtube-dl;t:~/.local/share/Trash/files;S:~/screenshots;c:~/.config;p:~/pins;P:~/Pictures;M:~/Music;v:~/Videos;" 
export NNN_OPENER=nnnopen #nnnopen path : /usr/bin/nnnopen
export NNN_TMPFILE='/tmp/.lastd'
export NNN_FCOLORS='c1e2904d976033f7c6d6ab84'
export NNN_COLORS='1234'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_TRASH=1
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)"
export NNN_RCLONE='rclone mount --read-only --no-checksum'
export NNN_LOCKER='unimatrix -l=aAcCegGkmnopPrRsS -s 95'
export NNN_HELP='fortune'
