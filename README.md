# Aaron's dotfiles
## How to pull everything

[Full tutorial](https://www.atlassian.com/git/tutorials/dotfiles)

1. git clone --bare https://github.com/Aronymous7/.dotfiles $HOME/.dotfiles
2. alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
3. config checkout
4. config config --local status.showUntrackedFiles no

## The software I use
### Get everything via apt

sudo apt install adwaita-icon-theme firefox-esr flameshot git gsimplecal htop i3 i3blocks lxappearance nomacs okular rxvt-unicode snapd steam syncthing texlive-full thunderbird tldr vifm vim vim-gui-common volumeicon-alsa xsel xss-lock

### Non-apt stuff

- bumblebee (intel + nvidia graphics)
- franz (combines messengers)
- intellij (java IDE)
- iosevka (font)
- vim-plug (vim plugin installer)

### Probably not needed

- network-manager (probably already pre-installed)
- pulse-audio (probably already pre-installed if needed)
- rivalcfg (for steelseries rival mice)
