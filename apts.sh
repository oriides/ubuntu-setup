#!/bin/bash

# add various keys and 3rd party repos –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

## vivaldi
sudo wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository -y 'deb https://repo.vivaldi.com/archive/deb/ stable main'
## lutris
sudo add-apt-repository -y ppa:lutris-team/lutris
## nextcloud-client
sudo add-apt-repository -y ppa:nextcloud-devs/client
## windscribe-cli
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key FDC247B7
echo 'deb https://repo.windscribe.com/ubuntu bionic main' | sudo tee /etc/apt/sources.list.d/windscribe-repo.list

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

sudo apt update

# install packages –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

sudo apt install -y audacity # sound recording/ editing
sudo apt install -y build-essential # required for rustc
sudo apt install -y baobab # disk usage analyzer
sudo apt install -y dconf-editor # musthave
sudo apt install -y default-jdk # java
sudo apt install -y evolution # mail client
sudo apt install -y evince # document viewer
sudo apt install -y ffmpeg # audio transcoder
sudo apt install -y file-roller # musthave
sudo apt install -y gimp # image editing
sudo apt install -y git # musthave
sudo apt install -y gnome-disk-utility # disks
sudo apt install -y gnome-terminal # terminal
sudo apt install -y gparted # advanced disk partitioning tool
sudo apt install -y inkscape # svg image editor
# sudo apt install -y kdeconnect # connection to phone
sudo apt install -y latexmk # LATEX
sudo apt install -y lutris # games
sudo apt install -y maven # java
sudo apt install -y nautilus # file explorer
sudo apt install -y nautilus-nextcloud # nextcloud extension for file explorer
# sudo apt install -y nautilus-kdeconnect # kdeconnect extension for file explorer
sudo apt install -y ncal # cli calendar
sudo apt install -y neofetch # musthave
sudo apt install -y net-tools # deprecated but still useful
sudo apt install -y network-manager-openvpn # openvpn support in network manager
sudo apt install -y network-manager-openvpn-gnome # openvpn support in network manager gui
sudo apt install -y nextcloud-client # nextcloud
sudo apt install -y openvpn # openvpn
sudo apt install -y pavucontrol # musthave
sudo apt install -y powerline # powerline (for vi)
sudo apt install -y pulseeffects # musthave
sudo apt install -y python3-pip # pip3
sudo apt install -y qemu # kernel based virtual machines
sudo apt install -y qemu-kvm # kernel based virtual machines
sudo apt install -y seahorse # ssh/gpg key manager
sudo apt install -y stacer # system monitor
sudo apt install -y steam # steam
sudo apt install -y texlive # LATEX
sudo apt install -y texlive-lang-german # LATEX
sudo apt install -y texlive-latex-extra # LATEX
sudo apt install -y texlive-extra-utils # LATEX
sudo apt install -y translate-shell # cli translator (for Ulauncher)
sudo apt install -y units # cli unit converter (for Ulauncher)
sudo apt install -y unzip # musthave
sudo apt install -y vim # vi improved
sudo apt install -y vim-gtk # clipboard access for vi
sudo apt install -y virt-manager # Virtual Machine Manager
sudo apt install -y vivaldi-stable # browser
sudo apt install -y vlc # media player
sudo apt install -y windscribe-cli # vpn
sudo apt install -y zsh # musthave

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

sudo apt update
sudo apt upgrade -y

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

clear
notify-send -i emblem-default "apts Script" "Done!"
echo "Done!"
