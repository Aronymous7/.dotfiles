# Aaron's dotfiles
## How to pull everything

[Full tutorial](https://www.atlassian.com/git/tutorials/dotfiles)

1. git clone --bare https://github.com/Aronymous7/.dotfiles $HOME/.dotfiles
1. alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
1. config checkout
1. config config --local status.showUntrackedFiles no
1. config update-index --assume-unchanged ~/.config/okularpartrc ~/.config/Dharkael/flameshot.ini

## The software I use
### Get everything via apt

sudo apt install alsa-utils arandr arc-theme build-essential cups curl dunst firefox-esr flameshot fonts-inconsolata git gsimplecal htop i3lock lxappearance neofetch network-manager nitrogen nomacs okular pandoc simple-scan suckless-tools sxhkd syncthing texlive-full thunderbird tldr tmux udevil unclutter unzip vifm vim vim-gui-common vlc xbacklight xclip xinput xmobar xmonad xorg xss-lock

### Non-apt stuff

- st
	- make
	- sudo make install clean
- vim-plug
	- curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	- :PlugInstall
- tpm
	- git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	- in tmux: prefix+I
- mons
	- git clone --recursive https://github.com/Ventto/mons.git
	- sudo make install
- franz
	- download from website + sudo apt install
	- cd /opt/franz + sudo chmod 4755 chrome-sandbox
	- settings: general off, appearance on

### Optional

- bumblebee (intel + nvidia graphics)
	- sudo apt install bumblebee-nvidia primus libgl1-nvidia-glx

## Fresh Debian setup

1. apt edit-sources -> enable contrib & non-free (optional: go testing or unstable)
1. sudo apt update && sudo apt dist-upgrade
1. export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
1. export EDITOR='vi'
1. visudo -> %sudo [...] NOPASSWD: ALL
1. sudo apt install vim git xorg
1. pull .dotfiles
1. eval $(sed '15q;d' ~/README.md)
1. install st

### Manual configuration

- firefox
	- sync, preferences
- lxappearance
	- set themes
- etc\_conf\_stuff
	- mouse acceleration, adjust accel speed
	- intel backlight (optional)
- okular
	- set keybindings
- syncthing
	- sync folders (Sync, Studium)
- thunderbird
	- connect webmail accounts (yahoo, tu, hotmail)
- alsamixer (optional)
	- cat /proc/asound/cards
	- create /etc/asound.conf
	- 2 lines: defaults.pcm.card num & defaults.ctl.card num
- network-manager
	- manage ethernet: delete lines in /etc/network/interfaces
- bluetooth
	- sudo systemctl disable bluetooth
- disable touchpad (optional)
	- alien: xinput --disable 14
- nitrogen
	- select wallpaper
- nomacs
	- dark theme
- vifm
	- comment out "highlight OtherWin [...]" in ~/.config/vifm/colors/Default.vifm
- grub-theme
	- sudo bash install.sh
- github ssh
	- ssh-keygen -t rsa -b 4096 -C "aaron.beigelbeck@yahoo.de"
	- eval "$(ssh-agent -s)"
	- ssh-add ~/.ssh/id\_rsa
	- add id\_rsa.pub to github
	- ssh -T git@github.com
	- config remote set-url origin git@github.com:Aronymous7/.dotfiles.git
- cups
	- add and configure printer

### Miscellaneous setup/config stuff

- switching to testing/sid
	- oldname -> newname
	- security: newname-security
