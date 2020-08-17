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

# Set JAVA_HOME
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"

# Extend PATH
PATH="$JAVA_HOME/bin:$PATH"

# Set default programs
export TERMINAL="st"
export EDITOR="vim"
export VISUAL="vim"
export BROWSER="firefox"
export MAIL="thunderbird"
