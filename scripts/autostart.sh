#!/bin/bash
nitrogen --restore &
[[ -z $(pgrep xss-lock) ]] && exec xss-lock -- i3lock -n -c 000000 &
[[ -z $(pgrep syncthing) ]] && exec syncthing -no-browser &
[[ -z $(pgrep unclutter) ]] && exec unclutter &
[[ -z $(pgrep devmon) ]] && exec devmon &
[[ -z $(pgrep dunst) ]] && exec dunst &
