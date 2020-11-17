#!/usr/bin/env bash

ffmpeg \
-f x11grab \
-s $(xdpyinfo | grep dimensions | awk '{print $2;}') \
-i :0.0 \
-f alsa \
-i default \
$1

# Useful tips for video editing:
#
# Concatenating:
# ffmpeg -f concat -i list.txt -c copy out.mkv
# With list.txt looking something like:
# file 'out1.mkv'
# ...
#
# Trimming:
# ffmpeg -i out.mkv -ss 00:00:05 -to 00:00:10 out.mkv
# with relative time:
# ffmpeg -i out.mkv -ss 00:00:05 -t 00:00:05 out.mkv
# without re-encoding:
# ffmpeg -i out.mkv -ss 00:00:05 -to 00:00:10 -c copy -avoid_negative_ts make_zero out.mkv
