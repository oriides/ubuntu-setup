#!/bin/bash

sudo wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo add-apt-repository -y ppa:lutris-team/lutris
sudo add-apt-repository -y 'deb https://repo.vivaldi.com/archive/deb/ stable main'
sudo add-apt-repository -y ppa:mikhailnov/pulseeffects
sudo add-apt-repository -y ppa:nextcloud-devs/client
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key FDC247B7
echo 'deb https://repo.windscribe.com/ubuntu bionic main' | sudo tee /etc/apt/sources.list.d/windscribe-repo.list

sudo apt update

sudo apt install -y aptitude
sudo apt install -y dconf-editor
sudo apt install -y default-jdk
sudo apt install -y evolution
sudo apt install -y flatpak
sudo apt install -y gimp
sudo apt install -y git
sudo apt install -y gnome-shell-extensions
sudo apt install -y gnome-software-plugin-flatpak
sudo apt install -y gnome-tweaks
sudo apt install -y gparted
sudo apt install -y handbrake
sudo apt install -y inkscape
sudo apt install -y lastpass-cli
sudo apt install -y lutris
sudo apt install -y maven
sudo apt install -y mongodb
sudo apt install -y neofetch
sudo apt install -y net-tools
sudo apt install -y network-manager-openvpn
sudo apt install -y network-manager-openvpn-gnome
sudo apt install -y nextcloud-client
sudo apt install -y obs-studio
sudo apt install -y ocs-url
sudo apt install -y openvpn
sudo apt install -y pavucontrol
sudo apt install -y postgresql
sudo apt install -y powerline
sudo apt install -y pulseeffects
sudo apt install -y python3-pip
sudo apt install -y qemu-kvm
sudo apt install -y scrcpy
sudo apt install -y spotify-client
sudo apt install -y stacer
sudo apt install -y steam
sudo apt install -y translate-shell
sudo apt install -y units
sudo apt install -y vim
sudo apt install -y vim-gtk
sudo apt install -y vivaldi-stable
sudo apt install -y windscribe-cli
sudo apt install -y zsh

sudo apt update
sudo apt upgrade

notify-send -i dialog-information "apts Script" "The following packages require manual installation:\n> Veracrypt\n> Ulauncher\n> Whatsdesk"

clear
notify-send -i emblem-default "apts Script" "Done\!"
echo "Done\!"
