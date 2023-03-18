# [ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"
if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi
# Alias 
alias nn='nnn -Rxl 5'
alias n='nnn -Rxl 5'
# EXPORT
export EDITOR='lvim'
export VISUAL='lvim'
export TERMINAL='kitty'
export NNN_PLUG='F:fixname;i:imgview;f:fzcd;t:mp3conv;v:preview-tui;s:!bash -i*;o:fzopen;p:rsynccp;m:mtpmount' #to play this plug press ; then choose option 
export NNN_BMS="m:/media/;g:$HOME/Documents/GitHub;d:$HOME/Downloads/;h:~;s:~/scripts;f:~/ffmpeg;C:~/cell;w:~/wallpapers;y:~/youtube-dl;t:~/.local/share/Trash/files;S:~/screenshots;c:~/.config;p:~/pins;P:~/Pictures;M:~/Music;v:~/Videos;" #to play this plug press b then choose option 
export NNN_OPENER=nnnopen #nnnopen path : /usr/bin/nnnopen
export NNN_TMPFILE='/tmp/.lastd'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_TRASH=1
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)"
export NNN_RCLONE='rclone mount --read-only --no-checksum'
export NNN_LOCKER='cmatrix'
# nnn theme 
# export NNN_COLORS='1267'
# export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
#
BLK="c1" CHR="e2" DIR="90" EXE="4b" REG="e7" HARDLINK="60" SYMLINK="33" MISSING="f7" ORPHAN="c6" FIFO="d6" SOCK="ab" OTHER="c4"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
# export NNN_FCOLORS='c1e2904be76033f7c6d6abc4'
#
# BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
# export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
#
# BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
# export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
