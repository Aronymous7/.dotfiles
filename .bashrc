# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history. See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt
PS1='\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'

    alias grep='grep --color=auto'
fi

# some more ls aliases
alias ll='ls -AlhF'
alias la='ls -AF'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable this, if it's already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Vi-mode
set -o vi
bind '"jj":vi-movement-mode'

# Disable CTRL-S and CTRL-Q
stty -ixon

# Custom aliases
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias xinitrc='vim ~/.xinitrc'
alias profileconf='vim ~/.profile'
alias xmonadconfig='vim ~/.xmonad/xmonad.hs'
alias xmobarconfig='vim ~/.config/xmobar/xmobarrc'
alias sxhkdconf='vim ~/.config/sxhkd/sxhkdrc'
alias tmuxconf='vim ~/.tmux.conf'
alias todo='vim ~/Sync/todo'

alias sdn='sudo shutdown now'
alias rbn='sudo shutdown -r now'
alias aptupgrade='sudo apt update && sudo apt upgrade'
alias aptlist='apt list --installed | grep'
alias cl='clear -x'
alias gtags='ctags -R --fields=+l .'

alias ds='pwd > /tmp/cwd'
alias dr='cd "$(</tmp/cwd)"'

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias configupd='config add -u && config commit -m "some changes" && config push'

# Make directory ans move into it
mkd() {
    mkdir -pv $1
    cd $1
}

# Unzip into folder of the same name in current directory
unzd() {
    if [[ $# != 1 ]]; then echo I need a single argument, the name of the archive to extract; return 1; fi
    target="${1%.zip}"
    unzip "$1" -d "${target##*/}"
}
