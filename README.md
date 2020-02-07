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

sudo apt install arandr arc-theme curl firefox-esr flameshot git gsimplecal htop i3lock imagemagick lxappearance neofetch network-manager nitrogen nomacs okular pandoc rxvt-unicode simple-scan suckless-tools syncthing texlive-full thunderbird tldr udevil unclutter unzip vifm vim vim-gui-common vlc xbacklight xinput xorg xsel xss-lock

### Non-apt stuff

- franz (combines messengers)
	- download from website + sudo apt install
	- cd /opt/franz + sudo chmod 4755 chrome-sandbox
- intellij (java IDE)
	- sudo apt install snapd
	- sudo snap install intellij-idea-community --classic
- iosevka (font)
	- mkd iosevka
	- wget https://github.com/be5invis/Iosevka/releases/download/v2.3.3/01-iosevka-2.3.3.zip
	- unzip 01-iosevka-2.3.3.zip
	- sudo mv ttf /usr/share/fonts/truetype/iosevka
	- sudo fc-cache
- mons (mirror screen)
	- git clone --recursive https://github.com/Ventto/mons.git
	- sudo make install
- vim-plug (vim plugin installer)
	- curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	- :PlugInstall

### Optional

- pulse-audio/alsa-utils (probably already pre-installed if needed)
- rivalcfg (for steelseries rival mice)
- bumblebee (intel + nvidia graphics)
	- sudo apt install bumblebee-nvidia primus libgl1-nvidia-glx

## Fresh Debian setup

1. apt edit-sources -> enable contrib & non-free (optional: go testing or unstable)
1. export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
1. export EDITOR='vi'
1. apt install sudo
1. usermod -a -G sudo aaron
1. visudo -> %sudo [...] NOPASSWD: ALL
1. sudo apt install vim git xorg
1. pull .dotfiles
1. sudo apt install xmonad xmobar rxvt-unicode firefox-esr unzip xsel
1. install apt stuff

### Manual configuration

- firefox
- lxappearance
- okular
- syncthing
- thunderbird
- alsamixer
- etc conf stuff (mousesens, xbacklight)
- touchpad

### Miscellaneous setup/config stuff

- switching to testing-branch
	- oldname -> newname
	- security: newname-security
