#!/bin/bash
ffmpeg -f alsa -ac 2 -i default -acodec libmp3lame -ab 320k ~/ffmpeg/$(date '+%y%m%d-%H%M-%S').mp3
