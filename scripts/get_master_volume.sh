#!/bin/bash
echo "vol $(amixer -M get Master | grep -o "[0-9]*%\|\[on\]\|\[off\]" | tr '\n' ' ' | sed "s/ [0-9].*$//")"
