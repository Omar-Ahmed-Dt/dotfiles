#!/bin/bash

# Usage:
# `$0`: Ask for recording type via dmenu
# `$0 screencast`: Record both audio and screen
# `$0 video`: Record only screen
# `$0 audio`: Record only audio
# `$0 kill`: Kill existing recording
#
# If there is already a running instance, user will be prompted to end it.

updateicon() { \
	echo "$1" > /tmp/recordingicon
	# pkill -RTMIN+9 "${STATUSBAR:-i3blocks}"
	pkill -RTMIN+9 i3blocks
	}

killrecording() {
	recpid="$(cat /tmp/recordingpid)"
	# kill with SIGTERM, allowing finishing touches.
	kill -15 "$recpid"
	rm -f /tmp/recordingpid
	updateicon ""
	pkill -RTMIN+9 i3blocks
	# even after SIGTERM, ffmpeg may still run, so SIGKILL it.
	sleep 3
	kill -9 "$recpid"
	exit
	}

screencast() { \
	ffmpeg -y \
	-f x11grab \
	-framerate 30 \
	-s "$(xdpyinfo | awk '/dimensions/ {print $2;}')" \
	-i "$DISPLAY" \
	-f alsa -i default \
	-r 30 \
 	-c:v h264 -crf 0 -preset ultrafast -c:a aac \
	"$HOME/ffmpeg/screencast/screencast-$(date '+%y%m%d-%H%M-%S').mp4" &
	echo $! > /tmp/recordingpid
	updateicon "⏺️🎙️"
       	}

video() { ffmpeg \
	-f x11grab \
	-s "$(xdpyinfo | awk '/dimensions/ {print $2;}')" \
	-i "$DISPLAY" \
 	-c:v libx264 -qp 0 -r 30 \
	"$HOME/ffmpeg/screencast/video-$(date '+%y%m%d-%H%M-%S').mp4" &
	echo $! > /tmp/recordingpid
	updateicon "⏺️"
	}

webcamhidef() { ffmpeg \
	-f v4l2 \
	-i /dev/video0 \
	-video_size 1920x1080 \
	"$HOME/ffmpeg/screencast/webcam-$(date '+%y%m%d-%H%M-%S').mkv" &
	echo $! > /tmp/recordingpid
	updateicon "🎥"
	}

webcam() { ffmpeg \
	-f v4l2 \
	-i /dev/video0 \
	-video_size 640x480 \
	"$HOME/ffmpeg/screencast/webcam-$(date '+%y%m%d-%H%M-%S').mkv" &
	echo $! > /tmp/recordingpid
	updateicon "🎥"
	}


audio() { \
	ffmpeg \
	-f alsa -i default \
	-c:a flac \
	"$HOME/ffmpeg/screencast/audio-$(date '+%y%m%d-%H%M-%S').flac" &
	echo $! > /tmp/recordingpid
	updateicon "🎙️"
	}

askrecording() { \
	choice=$(printf "screencast\\nvideo\\nvideo selected\\naudio\\nwebcam\\nwebcam (hi-def)" | dmenu -i -p "Select recording style:")
	case "$choice" in
		screencast) screencast;;
		audio) audio;;
		video) video;;
		*selected) videoselected;;
		webcam) webcam;;
		"webcam (hi-def)") webcamhidef;;
	esac
	}

asktoend() { \
	response=$(printf "No\\nYes" | dmenu -i -p "Recording still active. End recording?") &&
	[ "$response" = "Yes" ] &&  killrecording
	}

videoselected()
{
	slop -f "%x %y %w %h" > /tmp/slop
	read -r X Y W H < /tmp/slop
	rm /tmp/slop

	ffmpeg \
	-f x11grab \
	-framerate 60 \
	-video_size "$W"x"$H" \
	-i :0.0+"$X,$Y" \
	-c:v libx264 -qp 0 -r 30 \
	"$HOME/ffmpeg/screencast/box-$(date '+%y%m%d-%H%M-%S').mkv" &
	echo $! > /tmp/recordingpid
	updateicon "⏺️"
}

case "$1" in
	screencast) screencast;;
	audio) audio;;
	video) video;;
	*selected) videoselected;;
	kill) killrecording;;
	*) ([ -f /tmp/recordingpid ] && asktoend && exit) || askrecording;;
esac
