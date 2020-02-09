#!/bin/bash
echo "vol $(amixer -M get Master | grep -o "[0-9]*%\|\[on\]\|\[off\]" | sed 2q | tr '\n' ' ')"
