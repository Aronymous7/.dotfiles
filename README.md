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

sudo apt install arandr firefox-esr flameshot git gsimplecal htop i3 i3blocks lxappearance nomacs okular rxvt-unicode snapd syncthing texlive-full thunderbird tldr udevil vifm vim vim-gui-common volumeicon-alsa xbacklight xorg xsel xss-lock

### Non-apt stuff

- bumblebee (intel + nvidia graphics)
- franz (combines messengers)
- intellij (java IDE)
- iosevka (font)
- mons (mirror screen)
- vim-plug (vim plugin installer)

### Optional

- network-manager (probably already pre-installed)
- pulse-audio (probably already pre-installed if needed)
- rivalcfg (for steelseries rival mice)

## Fresh Debian setup

1. export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
1. export EDITOR='vi'
1. apt install sudo
1. usermod -a -G sudo aaron
1. visudo -> %sudo [...] NOPASSWD: ALL
1. sudo apt install vim git xorg
1. pull .dotfiles
1. sudo apt install i3 rxvt-unicode firefox-esr
1. install apt stuff

### Manual configuration

- firefox
- lxappearance
- okular
- syncthing
- thunderbird
- volumeicon
- xbacklight
- touchpad/mousesens
