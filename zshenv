[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"
if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi
# Alias 
alias nn='nnn -Rxl 5'
alias n='nnn -Rxl 5'
# EXPORT
export NNN_PLUG='F:fixname;i:imgview;f:fzcd;t:mp3conv;v:preview-tui;s:!bash -i*;o:fzopen;p:rsynccp;m:mtpmount' #to play this plug press ; then choose option 
export NNN_BMS="m:/media/;g:$HOME/Documents/GitHub;d:$HOME/Downloads/;h:~;s:~/scripts;f:~/ffmpeg;C:~/cell;w:~/wallpapers;y:~/youtube-dl;t:~/.local/share/Trash/files;S:~/screenshots;c:~/.config;p:~/pins;P:~/Pictures;M:~/Music;v:~/Videos;" #to play this plug press b then choose option 
export NNN_OPENER=nnnopen #nnnopen path : /usr/bin/nnnopen
export NNN_TMPFILE='/tmp/.lastd'
# export NNN_COLORS='1267'
# export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_FCOLORS='c1e2902e006033f7c6d6abc4'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_TRASH=1
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)"
export NNN_RCLONE='rclone mount --read-only --no-checksum'
export NNN_LOCKER='saidar -c'
