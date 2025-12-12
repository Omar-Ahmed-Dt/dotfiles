# -------------------------------------------------------
# NNN CONFIGURATION
# -------------------------------------------------------
export TERM="alacritty"
export EDITOR="nvim"
export VISUAL="nvim"
export NNN_SEL='/tmp/.sel'
export NNN_TMPFILE='/tmp/.lastd'
export NNN_FIFO='/tmp/nnn.fifo'

export NNN_PLUG_DIR="$HOME/scripts/nnn_plugins"

export NNN_PLUG="C:!magick \"\$nnn\" png:- | xclip -sel clipboard -t image/png*;f:$NNN_PLUG_DIR/fixname;i:$NNN_PLUG_DIR/nnn_imgs.sh;t:$NNN_PLUG_DIR/mp3conv;v:$NNN_PLUG_DIR/preview-tui;s:!zsh -i*;p:$NNN_PLUG_DIR/rsynccp;z:$NNN_PLUG_DIR/autojump;d:$NNN_PLUG_DIR/nnn_drag.sh;c:$NNN_PLUG_DIR/nnn_tomp4.sh;o:$NNN_PLUG_DIR/nnn_thunar.sh;S:$NNN_PLUG_DIR/nnn_terminal.sh"

export NNN_BMS="r:$HOME/rnote;m:/mnt/;g:$HOME/Documents/GitHub;D:$HOME/Documents/;d:$HOME/Downloads/;h:~;s:~/scripts;f:~/ffmpeg;C:~/cell;w:~/wallpapers;y:~/youtube-dl;t:~/.local/share/Trash/files;S:~/screenshots;c:~/.config;p:~/pins;P:~/Pictures;M:~/Music;v:~/Videos;"

export NNN_OPENER=nnnopen
export NNN_FCOLORS='a6d6908e00f66cf4a7d0afa7'
# export NNN_COLORS='5432'
# export NNN_FCOLORS='060504030201'
export NNN_TRASH=1
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)"
export NNN_LOCKER='unimatrix -l=aAcCegGkmnopPrRsS -s 95'
export NNN_HELP='fortune'
