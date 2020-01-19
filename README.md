# Aaron's dotfiles
## How to pull everything

[Full tutorial](https://www.atlassian.com/git/tutorials/dotfiles)

1. git clone --bare https://github.com/Aronymous7/.dotfiles $HOME/.dotfiles
1. alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
1. config checkout
1. config config --local status.showUntrackedFiles no
1. config update-index --assume-unchanged ~/.config/okularpartrc

## The software I use
### Get everything via apt

sudo apt install arandr curl firefox-esr flameshot git gnome-themes-extra-data gsimplecal htop i3 i3blocks lxappearance network-manager-gnome nomacs okular rxvt-unicode snapd sudo syncthing texlive-full thunderbird tldr udevil vifm vim vim-gui-common volumeicon-alsa xbacklight xinput xorg xsel xss-lock

### Non-apt stuff

- bumblebee (intel + nvidia graphics)
- franz (combines messengers)
	download from website + sudo apt install
- intellij (java IDE)
	sudo snap install intellij-idea-community --classic
- iosevka (font)
	mkd iosevka
	wget https://github.com/be5invis/Iosevka/releases/download/v2.3.3/01-iosevka-2.3.3.zip
	unzip 01-iosevka-2.3.3.zip
	sudo mv ttf /usr/share/fonts/truetype/iosevka
	sudo fc-cache
- mons (mirror screen)
	git clone --recursive https://github.com/Ventto/mons.git
	sudo make install
- vim-plug (vim plugin installer)
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	:PlugInstall

### Optional

- pulse-audio/alsa-utils (probably already pre-installed if needed)
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
- volumeicon/alsamixer
- xbacklight
- touchpad/mousesens
