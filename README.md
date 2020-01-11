# Aaron's dotfiles
## How to pull everything

[Full tutorial](https://www.atlassian.com/git/tutorials/dotfiles)

1. git clone --bare https://github.com/Aronymous7/.dotfiles $HOME/.dotfiles
2. alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
3. config checkout
4. config config --local status.showUntrackedFiles no
5. config update-index --assume-unchanged ~/.config/okularpartrc

## The software I use
### Get everything via apt

sudo apt install adwaita-icon-theme firefox-esr flameshot git gsimplecal htop i3 i3blocks lxappearance nomacs okular rxvt-unicode snapd syncthing texlive-full thunderbird tldr udevil vifm vim vim-gui-common volumeicon-alsa xorg xsel xss-lock

### Non-apt stuff

- bumblebee (intel + nvidia graphics)
- franz (combines messengers)
- intellij (java IDE)
- iosevka (font)
- vim-plug (vim plugin installer)

### Optional

- network-manager (probably already pre-installed)
- pulse-audio (probably already pre-installed if needed)
- rivalcfg (for steelseries rival mice)

## Fresh Debian setup

1. usermod -a -G sudo aaron
2. visudo -> %sudo [...] NOPASSWD: ALL
3. install git, xorg
4. setxkbmap de
5. pull .dotfiles
6. install rxvt-unicode, firefox-esr, i3
7. install apt stuff

### Manual configuration

- firefox
- lxappearance
- okular
- syncthing
- thunderbird
- volumeicon
