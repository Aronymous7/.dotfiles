# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	    . "$HOME/.bashrc"
    fi
fi

# Set PATH variable
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/snap/bin:~/.local/bin

# Set default programs
export TERMINAL="st"
export EDITOR="vim"
export VISUAL="vim"
export READER="okular"
export BROWSER="firefox"
export MAIL="thunderbird"
export CALENDAR="gsimplecal"

# For chromium sandbox (puppeteer)
export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox

# Launch X-server if logged in on TTY-1
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
 . startx
fi
