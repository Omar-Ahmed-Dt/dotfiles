#!/usr/bin/env python3

import musicpd
from datetime import datetime, timedelta
import cgi
import os.path
import time
import sys
import argparse

def main():

    parser = argparse.ArgumentParser()
    parser.add_argument('--host', '-s', type=str, default='localhost', \
            help='Specify the host mpd is running on')
    parser.add_argument('--port', '-p', type=int, default=6600, \
            help='Specify the port mpd is running on')
    parser.add_argument('--play_symbol', type=str, default="f144", \
            help='Symbol-code for playing music')
    parser.add_argument('--pause_symbol', type=str, default="f28b", \
            help='Symbol-code for paused music')
    parser.add_argument('--stop_symbol', type=str, default="f28d", \
            help='Symbol-code for stopped music')
    parser.add_argument('--refresh-time', '-r', type=float, default=0.5, \
            help='Interval for when to check data in seconds (float)')
    parser.add_argument('--text-refresh-rate', '-R', type=float, default=1, \
            help='Interval for text rotation:' \
            'index will be increased by x for every r')
    parser.add_argument('--string-length', '-l', type=int, default=45, \
            help='Total length of printed string')
    parser.add_argument('--pango', '-m', action='store_true', \
            help='Enables printing with pango markup. ' \
            ' Required for some unicode symbols.')
    parser.add_argument('--unicode-font', type=str, \
            default='Font Awesome 5 Free Solid', \
            help='Font for drawing unicode symbols')
    parser.add_argument('--regular-font', type=str, \
            default='DejaVu Sans Mono', \
            help='Font for regular text')
    parser.add_argument('--no-artist', action='store_true', \
            help='Disable showing the artist')
    parser.add_argument('--no-title', action='store_true', \
            help='Disable showing the title')

    args = parser.parse_args()

    try:
        client = musicpd.MPDClient()
        client.connect(args.host, args.port)

        index = 0.0
        while True:

            if args.pango:
                play, pause, stop = pango_unicode(args)
            else:
                play, pause, stop = python_unicode(args)

            data = get_info(client)
            state = data[0]['state']

            if state == 'play':
                title_str, time_str, index = generate_title_string(data, args, index)
                title_string = '%s%s%s' % (play, title_str, time_str)
            elif state == 'pause':
                title_str, time_str, index = generate_title_string(data, args, index)
                title_string = '%s%s%s' % (pause, title_str, time_str)
            else:
                title_string = '%s  %s' % (stop, generate_title_string(None, args))

            print(title_string)
            sys.stdout.flush()
            time.sleep(args.refresh_time)

    finally:
        client.close()
        client.disconnect()

def generate_title_string(data, args, previous_index = 0):
    if data is None:
        if args.pango:
            return '<span foreground="#a2a5aa"><i>%s</i></span>' % ('-' * (args.string_length - 3))
        else:
            return '-' * (args.string_length - 3)
    else:
        elapsed = int(float(data[0]['elapsed']))
        if 'duration' in data[0].keys():
            total = int(float(data[0]['duration']))
        else:
            total = None
        time_str = time_string(elapsed, total)
        time_len = len(time_str)
#        remaining_len = args.string_length - time_len - 3 #play symbol + spaces
        remaining_length = args.string_length - time_len - 1 #play symbol

        a_exists = False
        t_exists = False
        f_exists = False
        file_name = "[no data]"

        keys = data[1].keys()

        if not args.no_artist and 'artist' in keys:
            a_exists = True
            artist = data[1]['artist']
            if type(artist) == list:
                artist = concat_list(artist)
        if not args.no_title and 'title' in keys:
            t_exists = True
            title = data[1]['title']
            if type(title) == list:
                title = concat_list(title)
        if 'file' in keys:
            f_exists = True
            file_name = data[1]['file']
            if type(file_name) == list:
                file_name = concat_list(file_name)
            if 'http' in file_name:
                file_name = "[url]" #TODO get name from url?
            else:
                file_name = os.path.splitext(os.path.basename(file_name))[0]

        if a_exists and not t_exists:
            song_info = artist
        elif not a_exists and t_exists:
            song_info = title
        elif a_exists and t_exists:
            song_info = artist + " - " + title
        else:
            song_info = file_name

        if len(song_info) <= remaining_length - 3:
            song_info = song_info.center(remaining_length, ' ')
            idx = 0.0
        else:
            idx = (previous_index + args.text_refresh_rate) % (len(song_info) + 4)
            end = int(idx) + remaining_length - 3
            song_info = song_info + ' ++ ' + song_info
            song_info = song_info[int(idx):end]
            song_info = song_info.center(remaining_length, ' ')

        if args.pango:
            return cgi.escape(song_info, quote=True), time_str, idx
        else:
            return song_info, time_str, idx

def get_info(client):
    client.command_list_ok_begin()
    client.status()
    client.currentsong()
    return client.command_list_end()

def python_unicode(args):
    play = chr(int(args.play_symbol, 16))
    pause = chr(int(args.pause_symbol, 16))
    stop = chr(int(args.stop_symbol, 16))
    return play, pause, stop

def pango_unicode(args):
    """
    Returns the play/pause/stop symbols as pango markup
    """
    play = "<span font_desc='%s'>&#x%s;</span>" % \
            (args.unicode_font, args.play_symbol)
    pause = "<span font_desc='%s'>&#x%s;</span>" % \
            (args.unicode_font, args.pause_symbol)
    stop = "<span font_desc='%s'>&#x%s;</span>" % \
            (args.unicode_font, args.stop_symbol)
    return play, pause, stop

def time_string(elapsed, total):
    """
    converts elapsed and total into a string of the shape:
        [mm:ss/mm:ss] or [hh:mm:ss/hh:mm:ss]
    """
    e = datetime(1,1,1) + timedelta(seconds=elapsed)
    if total is not None:
        t = datetime(1,1,1) + timedelta(seconds=total)

    if total is None:
        return "[%02d:%02d:%02d/--:--:--]" % (e.hour, e.minute, e.second)
    else:
        if total > 3600:
            return "[%02d:%02d:%02d/%02d:%02d:%02d]" % (e.hour, e.minute, e.second,
                    t.hour, t.minute, t.second)
        else:
            return "[%02d:%02d/%02d:%02d]" % (e.minute, e.second, t.minute, t.second)


def concat_list(l):
    result = ""
    for i in range(len(l)-1):
        result += l[i] + " | "
    result += l[-1]
    return result


if __name__ == "__main__":
    main()
