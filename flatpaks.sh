#!/bin/bash

sudo apt install -y flatpak
sudo apt install -y gnome-software-plugin-flatpak

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y com.bitwarden.desktop
flatpak install -y org.blender.Blender
flatpak install -y org.onlyoffice.desktopeditors
flatpak install -y com.discordapp.Discord
flatpak install -y org.kde.krita
flatpak install -y com.getpostman.Postman
flatpak install -y com.valvesoftware.SteamLink
flatpak install -y com.github.taiko2k.tauonmb

clear
notify-send -i emblem-default "flatpaks Script" "Done\!"
echo "Done\!"