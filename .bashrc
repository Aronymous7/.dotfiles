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
  alias ls='ls -F --color=auto --group-directories-first'
  alias grep='grep --color=auto'
fi

# some more ls aliases
alias ll='ls -AlhF'
alias la='ls -AF'

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

# Needed for rbenv to work
# eval "$(rbenv init -)"

# Custom aliases
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias todo='vim ~/Sync/todo'

alias paci='sudo pacman --needed -S'
alias pacr='sudo pacman -Rns'
alias pacs='pacman -Ss'
alias pacq='pacman -Q | grep -i'
alias cl='clear -x'

alias ds='pwd > /tmp/cwd'
alias dr='cd "$(</tmp/cwd)"'

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias configupd='config add -u && config commit -m "some changes" && config push'

alias setkb='setxkbmap us -option "ctrl:nocaps,shift:both_capslock"'

alias srcjava='find -name "*.java" > sources.txt'
alias setjava8='export JAVA_HOME="/usr/lib/jvm/java-8-openjdk" && PATH="$JAVA_HOME/bin:$PATH"'
alias setjava14='export JAVA_HOME="/usr/lib/jvm/java-14-openjdk" && PATH="$JAVA_HOME/bin:$PATH"'

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

# ex - archive extractor - usage: ex <file>
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1    ;;
      *.tar.gz)    tar xzf $1    ;;
      *.tar.xz)    tar xJf $1    ;;
      *.bz2)       bunzip2 $1    ;;
      *.rar)       unrar x $1    ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xf $1     ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip $1      ;;
      *.Z)         uncompress $1 ;;
      *.7z)        7z x $1       ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/aaron/.sdkman"
[[ -s "/home/aaron/.sdkman/bin/sdkman-init.sh" ]] && source "/home/aaron/.sdkman/bin/sdkman-init.sh"
