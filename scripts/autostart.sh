#!/bin/bash

# Run these programs at system startup. This script gets executed in ~/.xinitrc

nitrogen --restore &
[[ -z $(pgrep xss-lock) ]] && exec xss-lock -- i3lock -n -c 000000 &
[[ -z $(pgrep syncthing) ]] && exec syncthing -no-browser &
[[ -z $(pgrep unclutter) ]] && exec unclutter &
[[ -z $(pgrep devmon) ]] && exec devmon &
[[ -z $(pgrep dunst) ]] && exec dunst &
[[ -z $(pgrep sxhkd) ]] && exec sxhkd &
