set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_visual block
##
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths


### EXPORT ###
# set fish_greeting                                 # Supresses fish's intro message
set TERMINAL "kitty"                         # Sets the terminal type
set EDITOR   "lvim"
set VISUAL   "lvim"
set -x BROWSER firefox

#set DISPLAY ":0.0"

### "bat" as manpager
# bat --list-themes | less
# set -x MANPAGER "sh -c 'bat --theme gruvbox-dark -l man -p'"
set -x MANPAGER "sh -c 'bat --theme Monokai -l man -p'"

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
# set fish_color_normal brcyan
# set fish_color_autosuggestion '#7d7d7d'
# set fish_color_command brcyan
# set fish_color_error '#ff6c6b'
# set fish_color_param brcyan

### SPARK ###
# set -g spark_version 1.0.0

# complete -xc spark -n __fish_use_subcommand -a --help -d "Show usage help"
# complete -xc spark -n __fish_use_subcommand -a --version -d "$spark_version"
# complete -xc spark -n __fish_use_subcommand -a --min -d "Minimum range value"
# complete -xc spark -n __fish_use_subcommand -a --max -d "Maximum range value"

# function spark -d "sparkline generator"
#     if isatty
#         switch "$argv"
#             case {,-}-v{ersion,}
#                 echo "spark version $spark_version"
#             case {,-}-h{elp,}
#                 echo "usage: spark [--min=<n> --max=<n>] <numbers...>  Draw sparklines"
#                 echo "examples:"
#                 echo "       spark 1 2 3 4"
#                 echo "       seq 100 | sort -R | spark"
#                 echo "       awk \\\$0=length spark.fish | spark"
#             case \*
#                 echo $argv | spark $argv
#         end
#         return
#     end

#     command awk -v FS="[[:space:],]*" -v argv="$argv" '
#         BEGIN {
#             min = match(argv, /--min=[0-9]+/) ? substr(argv, RSTART + 6, RLENGTH - 6) + 0 : ""
#             max = match(argv, /--max=[0-9]+/) ? substr(argv, RSTART + 6, RLENGTH - 6) + 0 : ""
#         }
#         {
#             for (i = j = 1; i <= NF; i++) {
#                 if ($i ~ /^--/) continue
#                 if ($i !~ /^-?[0-9]/) data[count + j++] = ""
#                 else {
#                     v = data[count + j++] = int($i)
#                     if (max == "" && min == "") max = min = v
#                     if (max < v) max = v
#                     if (min > v ) min = v
#                 }
#             }
#             count += j - 1
#         }
#         END {
#             n = split(min == max && max ? "▅ ▅" : "▁ ▂ ▃ ▄ ▅ ▆ ▇ █", blocks, " ")
#             scale = (scale = int(256 * (max - min) / (n - 1))) ? scale : 1
#             for (i = 1; i <= count; i++)
#                 out = out (data[i] == "" ? " " : blocks[idx = int(256 * (data[i] - min) / scale) + 1])
#             print out
#         }
#     '
# end
### END OF SPARK ###


### FUNCTIONS ###
# Spark functions
# function letters
#     cat $argv | awk -vFS='' '{for(i=1;i<=NF;i++){ if($i~/[a-zA-Z]/) { w[tolower($i)]++} } }END{for(i in w) print i,w[i]}' | sort | cut -c 3- | spark | lolcat
#     printf  '%s\n' 'abcdefghijklmnopqrstuvwxyz'  ' ' | lolcat
# end

# function commits
#     git log --author="$argv" --format=format:%ad --date=short | uniq -c | awk '{print $1}' | spark | lolcat
# end

# Functions needed for !! and !$
#function __history_previous_command
#  switch (commandline -t)
#  case "!"
#    commandline -t $history[1]; commandline -f repaint
#  case "*"
#    commandline -i !
#  end
#end

#function __history_previous_command_arguments
#  switch (commandline -t)
#  case "!"
#    commandline -t ""
#    commandline -f history-token-search-backward
#  case "*"
#    commandline -i '$'
#  end
#end
# The bindings for !! and !$
#if [ $fish_key_bindings = "fish_vi_key_bindings" ];
#  bind -Minsert ! __history_previous_command
#  bind -Minsert '$' __history_previous_command_arguments
#else
#  bind ! __history_previous_command
#  bind '$' __history_previous_command_arguments
#end

# Function for creating a backup file
# ex: backup file.txt
# result: copies file as file.txt.bak
# function backup --argument filename
#     cp $filename $filename.bak
# end

# Function for copying files and directories, even recursively.
# ex: copy DIRNAME LOCATIONS
# result: copies the directory and all of its contents.
#function copy
#    set count (count $argv | tr -d \n)
#    if test "$count" = 2; and test -d "$argv[1]"
#	set from (echo $argv[1] | trim-right /)
#	set to (echo $argv[2])
#        command cp -r $from $to
#    else
#        command cp $argv
#    end
#end

# Function for printing a column (splits input on whitespace)
# ex: echo 1 2 3 | coln 3
# output: 3
#function coln
#    while read -l input
#        echo $input | awk '{print $'$argv[1]'}'
#    end
#end

# Function for printing a row
# ex: seq 3 | rown 3
# output: 3
#function rown --argument index
#    sed -n "$index p"
#end

# Function for ignoring the first 'n' lines
# ex: seq 10 | skip 5
# results: prints everything but the first 5 lines
#function skip --argument n
#    tail +(math 1 + $n)
#end

# Function for taking the first 'n' lines
# ex: seq 10 | take 5
# results: prints only the first 5 lines
#function take --argument number
#    head -$number
#end

# Function for org-agenda
#function org-search -d "send a search string to org-mode"
    #set -l output (/usr/bin/emacsclient -a "" -e "(message \"%s\" (mapconcat #'substring-no-properties \
        #(mapcar #'org-link-display-format \
        #(org-ql-query \
        #:select #'org-get-heading \
        #:from  (org-agenda-files) \
        #:where (org-ql--query-string-to-sexp \"$argv\"))) \
        #\"
    #\"))")
    #printf $output
#end

### END OF FUNCTIONS ###


### ALIASES ###
# \x1b[2J   <- clears tty
# \x1b[1;1H <- goes to (1, 1) (start)
alias clear='echo -en "\x1b[2J\x1b[1;1H" ; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'

# root privileges
#alias doas="doas --"

# navigation
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias jctl="journalctl -e"

# gpg encryption
# verify signature for isos
# alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
# alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# youtube-dl
# alias yta-aac="youtube-dl --extract-audio --audio-format aac "
# alias yta-best="youtube-dl --extract-audio --audio-format best "
# alias yta-flac="youtube-dl --extract-audio --audio-format flac "
# alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
# alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
# alias yta-opus="youtube-dl --extract-audio --audio-format opus "
# alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
# alias yta-wav="youtube-dl --extract-audio --audio-format wav "
# alias ytv-best="youtube-dl -f bestvideo+bestaudio "

# switch between shells
# I do not recommend switching default SHELL from bash.
alias tobash="doas chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="doas chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="doas chsh $USER -s /bin/fish && echo 'Now log out.'"
# alias prop="xprop"


# bare git repo alias for dotfiles
#alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"

# termbin
# alias tb="nc termbin.com 9999"

# the terminal rickroll
# alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# Unlock LBRY tips
# alias tips="lbrynet txo spend --type=support --is_not_my_input --blocking"

### DTOS ###
# Copy/paste all content of /etc/dtos over to home folder. A backup of config is created. (Be careful running this!)
# alias dtoscopy='[ -d ~/.config ] || mkdir ~/.config && cp -Rf ~/.config ~/.config-backup-(date +%Y.%m.%d-%H.%M.%S) && cp -rf /etc/dtos/* ~'
# Backup contents of /etc/dtos to a backup folder in $HOME.
# alias dtosbackup='cp -Rf /etc/dtos ~/dtos-backup-(date +%Y.%m.%d-%H.%M.%S)'

#my config 
# alias p='cd ..'
alias X='doas chmod 777'
alias x='doas chmod 744'
alias do='doas'

$HOME/github/shell-color-scripts/colorscript.sh -r # && $HOME/scripts/clock3.sh
# pokemon-colorscripts --no-title -r 
# fastfetch

alias pmi='doas pacman -S'
# alias pmu='doas pacman -Syyu --noconfirm'
alias pmu='doas pacman -Syyu'
alias pmuu='paru -Syu'
alias pmr='doas pacman -Rs'
alias pmR='doas pacman -Rd --nodeps' #remove pkg without dependencies
alias pmii='paru -S'
# alias pmq='pacman -Qq'
alias pmq='pacman -Q'
alias pmn='pacman -Q | wc -l'
alias pmc='doas pacman -Sc' #clean the cache after upgrade my system 
alias pmg='pamac-manager'
alias pmf="pacman -Qqo"
# alias bs='browser-sync start --server --files "*.js, *.html, *.css"'
alias e='exit'
alias tomp3='sh ~/scripts/tomp3.sh'
# alias install='makepkg -si'
alias md='mkdir'
alias config='/home/omar/scripts/configs.sh'
alias blk='lsblk'
alias img='~/scripts/sxivall1.sh'
alias imgall='~/scripts/sxivall2.sh'
alias gc='cd ~/.config'
# alias cdi='cd ~/.config/i3'
alias ram='ps axh -o cmd:15,%mem --sort=-%mem | head | string trim'
alias cpu='ps axh -o cmd:15,%cpu --sort=-%cpu | head'
alias bup='sh /home/omar/scripts/gitupload.sh'
alias df='duf -hide special'
alias dfdr='dust'
alias dfd='dust -r'
alias printer='system-config-printer'
alias printerinstall='hp-setup -u'
alias epdf='okular'
# alias topdf='sh ~/scripts/topdf.sh'
# alias lf='lfrun'
# alias gn='cd ~/.config/nnn'
alias tl='trash-list' 
alias tr='trash-restore'
alias gt='cd ~/.local/share/Trash/files'
alias te='trash-empty'
alias gs='cd ~/scripts'
alias pr='proxychains'
alias pf='proxychains firefox'
alias toand='sh ~/scripts/android.sh'
# alias N='prime-run'
alias m='~/scripts/matrix.sh'
alias gx='cd /usr/share/xsessions'
alias ft='xdg-mime query filetype'
alias fd='xdg-mime query default'
# alias search='find / -iname'
alias rip='~/scripts/rip.sh' #to get public ip 
alias ip='ip --color' #to get private ip 
alias ll='lsd -lh --icon-theme unicode'
alias la="lsd -lah --icon-theme unicode"
alias l="lsd --icon-theme unicode"
alias ls="lsd --icon-theme unicode"
alias llp="lsd -lh --permission octal --icon-theme unicode"
alias lls="lsd -lhS --icon-theme unicode"
alias llt="lsd -lht --icon-theme unicode"
alias llS="lsd -l --total-size 2> /dev/null --icon-theme unicode"
alias gcalc='gnome-calculator'
alias calc='kalker'
alias smus='mpd && ncmpcpp'
alias mus='ncmpcpp'
alias emus='pkill mpd'
alias rd='zaread'
alias size='du -sh 2> /dev/null'
alias gm='cd /media'
alias code='vscodium'
# alias code='flatpak run com.vscodium.codium'
alias gsh="~/scripts/gsh.sh"
# alias theme="~/scripts/kitty_theme.sh"
# alias f="doas find / -iname"
alias uprsc="xrdb -load ~/.Xresources"
alias gpu="doas lvim /etc/optimus-manager/optimus-manager.conf"
alias smi="nvidia-smi"
alias rmft="rm ~/.config/fish/functions/fish_prompt.fish"
alias theme="kitty +kitten themes"
alias journ="journalctl -f"
alias note="io.github.lainsce.Notejot"
alias rm="rm -i"
alias V="doasedit"
alias rf='source ~/.config/fish/config.fish'
alias rkeys="~/scripts/keys.sh"
alias rmpm="doas rm /var/lib/pacman/db.lck"
alias cd="z"
# alias ssh="kitty +kitten ssh"
# alias op="~/scripts/ozathura.sh"
# alias ov="~/scripts/ompv.sh"
alias cat="lolcat"
alias prop="xprop | grep WM_CLASS"
alias dl="~/scripts/dlfile.sh"
alias dlmv="~/scripts/mvdragon.sh"
alias dlcp="~/scripts/cpdrag.sh"
alias ytm="ytfzf --pages=2 -m -t -l -s"
alias ytv="ytfzf --pages=2 -t -l -s"
# alias ytm="ytfzf -m -t -l"
# alias ytv="ytfzf -t -l"
alias phn="~/scripts/scrcpy.sh"
alias pipes="pipes.sh"
alias ssh="kitty +kitten ssh"
alias st="speedtest-cli --simple --secure"
alias stm="nload -u m -m wlp3s0"
# alias mc="missioncenter"
alias wsh="~/scripts/windows.sh"
alias mega="megabasterd"
alias clock="tty-clock -xscbt"
# alias sudo="doas"
alias ping="ping -c 10"
alias us="~/scripts/ssh.sh"
alias br="ipman"
alias dr='~/scripts/dr.sh'
alias mm='~/scripts/mount_manager.sh'
alias chmm='~/scripts/kill_mnt_processes.sh'
alias topdf='~/scripts/extract_pages.sh'

# alias lf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -r -I % $EDITOR %"

# Function for fish 

# function pms
#     # pacman -Ss $argv | grep / | awk -F/ '{print $2}' | awk '{print $1}'
#     pacman -Ss $argv | grep / | awk -F/ '{print $2}'
# end

# function pmss
#     paru -Ss $argv | grep / | awk -F/ '{print $2}'
# end

function se
    cd ~/scripts
    fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -r sh 
    cd -
end 

# function sc 
    # cd ~/scripts
    # fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | awk '{print $3}' | xargs -r -I % $EDITOR %
    # cd -
# end 

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
    yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk "{print \$2}")' | xargs -ro  yay -S
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
    # du -a ~/scripts/ | awk '{print $2}' | fzf --preview='head -$LINES {}' | xargs -r $EDITOR 
end 
# excution selected script 
function se
    cd ~/scripts/
    fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -r /bin/bash
    cd - 
    # du -a ~/scripts/ | awk '{print $2}' | fzf --preview='head -$LINES {}' | xargs -r sh
end 
#search in $pwd and open it 
# function sf 
#     fzf --preview='head -$LINES {}'| xargs -r -I % $EDITOR % 
# end 
# alias to lvim 
function v
    lvim $argv
end

function V
    sudo -E lvim $argv
end

function vi 
    vim $argv 
end 

function lk
  set loc (walk --icons $argv); and cd $loc;
end

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
####################################
####################################
# name: sashimi prompt 

# function __fzf_cd -d "Change directory"
#     set -l commandline (__fzf_parse_commandline)
#     set -l dir $commandline[1]
#     set -l fzf_query $commandline[2]

#     if not type -q argparse
#         # Fallback for fish shell version < 2.7
#         function argparse
#             functions -e argparse # deletes itself
#         end
#         if contains -- --hidden $argv; or contains -- -h $argv
#             set _flag_hidden "yes"
#         end
#     end

#     # Fish shell version >= v2.7, use argparse
#     set -l options  "h/hidden"
#     argparse $options -- $argv

#     set -l COMMAND

#     set -q FZF_CD_COMMAND
#     or set -l FZF_CD_COMMAND "
#     command find -L \$dir -mindepth 1 \\( -path \$dir'*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
#     -o -type d -print 2> /dev/null | sed 's@^\./@@'"

#     set -q FZF_CD_WITH_HIDDEN_COMMAND
#     or set -l FZF_CD_WITH_HIDDEN_COMMAND "
#     command find -L \$dir \
#     \\( -path '*/\\.git*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
#     -o -type d -print 2> /dev/null | sed 1d | cut -b3-"

#     if set -q _flag_hidden
#         set COMMAND $FZF_CD_WITH_HIDDEN_COMMAND
#     else
#         set COMMAND $FZF_CD_COMMAND
#     end

#     eval "$COMMAND | "(__fzfcmd)" +m $FZF_DEFAULT_OPTS $FZF_CD_OPTS --query \"$fzf_query\"" | read -l select

#     if not test -z "$select"
#         builtin cd "$select"

#         # Remove last token from commandline.
#         commandline -t ""
#     end

#     commandline -f repaint
# end

#my config for nnn file manger alias nnn='nnn -eRx'
alias nn='nnn -rxl 5' 
alias n='nnn -rxl 5'
export NNN_PLUG='c:!convert "$nnn" png:- | xclip -sel clipboard -t image/png*;u:upload;f:fixname;i:imgview;t:mp3conv;v:preview-tui;s:!bash
-i*;p:rsynccp;n:nmount;z:autojump;d:~/scripts/dr.sh'
export NNN_BMS="a:$HOME/home_docker/metube/videos;r:$HOME/rnote;m:/mnt/sdb1/;g:$HOME/Documents/GitHub;d:$HOME/Downloads/;h:~;s:~/scripts;f:~/ffmpeg;C:~/cell;w:~/wallpapers;y:~/youtube-dl;t:~/.local/share/Trash/files;S:~/screenshots;c:~/.config;p:~/pins;P:~/Pictures;M:~/Music;v:~/Videos;" 
export NNN_OPENER=nnnopen #nnnopen path : /usr/bin/nnnopen
export NNN_TMPFILE='/tmp/.lastd'
export NNN_FCOLORS='c1e2904be76033f7c6d6abc4'
export NNN_COLORS="2136"                           
export NNN_FIFO=/tmp/nnn.fifo
export NNN_TRASH=1
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)"
export NNN_RCLONE='rclone mount --read-only --no-checksum'
export NNN_LOCKER='unimatrix -l=aAcCegGkmnopPrRsS -s 95'
export NNN_HELP='fortune'
