#!/bin/bash
echo "vol $(amixer -M get Master | grep -o "[0-9]*%\|\[on\]\|\[off\]" |
	tr '\n' ' ' | awk '{print $1,$2}')"
