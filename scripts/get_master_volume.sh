#!/bin/bash

# Use alsa to get the volume and mute-status of the Master-channel. Only takes one side in case of
# stereo. Can be used for displaying volume in the status bar

echo "vol $(amixer -M get Master | grep -o "[0-9]*%\|\[on\]\|\[off\]" |
	tr '\n' ' ' | awk '{print $1,$2}')"
