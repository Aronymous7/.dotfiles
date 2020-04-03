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

sudo apt install alsa-utils arandr arc-theme build-essential catdoc cups curl docx2txt dunst exuberant-ctags firefox-esr flameshot fonts-inconsolata git gsimplecal htop httpie i3lock imagemagick libreoffice lxappearance neofetch network-manager network-manager-gnome nitrogen nodejs nomacs npm okular pandoc simple-scan suckless-tools sxhkd syncthing texlive-full thunderbird tldr tmux tmuxinator udevil unclutter unzip vifm vim vim-gui-common vlc xbacklight xclip xinput xmobar xmonad xorg xss-lock

### Non-apt stuff

- st
  - make
  - sudo make install clean
- vim-plug
  - curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  - :PlugInstall
- mons
  - git clone --recursive https://github.com/Ventto/mons.git
  - sudo make install
- YCM
  - sudo apt install build-essential cmake vim python3-dev
  - cd -> python3 install.py --ts-complete
  - sudo npm install --global vscode-css-languageserver-bin

### Optional

- bumblebee (intel + nvidia graphics)
  - free: sudo apt install bumblebee primus
  - proprietary: sudo apt install bumblebee-nvidia primus libgl1-nvidia-glx
- python stuff for UltiSnips
  - python3-unidecode

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

- vim
  - mkdir ~/.config/vimundo
- lxappearance
  - set themes
- thunderbird
  - connect webmail accounts (yahoo, tu, hotmail)
- etc_conf_stuff
  - mouse acceleration, adjust accel speed
  - intel backlight (optional)
- network-manager
  - manage ethernet: delete lines in /etc/network/interfaces
- bluetooth
  - sudo systemctl disable bluetooth
- firefox
  - sync, preferences
- syncthing
  - sync folders (Sync, Studium)
- alsamixer (optional)
  - cat /proc/asound/cards
  - create /etc/asound.conf
  - 2 lines: defaults.pcm.card num & defaults.ctl.card num
  - alien: unmute HP/Speaker Auto Detect
- disable touchpad (optional)
  - alien: xinput --disable 14
- okular
  - set keybindings
  - editor-settings: vim --remote-silent +%l "%f"
- nomacs
  - dark theme
- vifm
  - comment out "highlight OtherWin [...]" in ~/.config/vifm/colors/Default.vifm
- tmuxinator
  - sudo wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.bash -O /etc/bash_completion.d/tmuxinator.bash
- nitrogen
  - select wallpaper
- grub-theme
  - sudo bash install.sh
- github ssh
  - ssh-keygen -t rsa -b 4096 -C "aaron.beigelbeck@yahoo.de"
  - eval "$(ssh-agent -s)"
  - ssh-add ~/.ssh/id_rsa
  - add id_rsa.pub to github
  - ssh -T git@github.com
  - config remote set-url origin git@github.com:Aronymous7/.dotfiles.git
- cups
  - add and configure printer

### Miscellaneous setup/config stuff

- switching to testing/sid
  - oldname -> newname
  - security: newname-security
- chromium-sandbox (puppeteer)
  - cd <project-dir-path>/node_modules/puppeteer/.local-chromium/linux-<revision>/chrome-linux/
  - sudo chown root:root chrome_sandbox
  - sudo chmod 4755 chrome_sandbox
  - sudo cp -p chrome_sandbox /usr/local/sbin/chrome-devel-sandbox

## Manjaro (XFCE)

sudo pacman-mirrors -c Germany

sudo pacman --needed -S base-devel catdoc cmake code ctags docx2txt firefox git gvim httpie jdk-openjdk jre-openjdk libreoffice-fresh manjaro-printer neofetch nomacs pandoc python simple-scan syncthing texlive-most thunderbird timeshift tldr tmux tmuxp ttf-droid ttf-inconsolata unclutter vifm vlc xdotool xorg-xrandr yay zathura zathura-pdf-poppler

yay -S rstudio-desktop-bin saxon-he

__node/npm:__ nodejs / nodejs-lts-erbium, npm

__ruby/rails:__ ruby, ruby-irb, ruby-rdoc, ruby-docs, yarn, gem install rails (-v ...)

__gaming:__ steam-manjaro, [lutris](https://github.com/lutris/lutris/wiki/Wine-Dependencies), wine-mono, wine-gecko, gamemode, lib32-gamemode

__manual:__ st, vim-plug, mons, YCM

__vscode extensions:__ Trailing Spaces, Vim, XML, XML Tools

### Manual configuration

- visudo and delete /etc/sudoers.d/...
- mkdir ~/.config/vimundo
- thunderbird setup (app password for hotmail and yahoo)
- disable bluetooth
- firefox sync
- syncthing setup
- ssh-key for github
- enable printing: sudo systemctl enable --now org.cups.cupsd.service
- snapd (optional)
  - sudo systemctl enable --now snapd.socket
  - sudo ln -s /var/lib/snapd/snap /snap
  - restart
