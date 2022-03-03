#!/bin/bash

# install flatpak support ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

sudo apt install -y flatpak
sudo apt install -y gnome-software-plugin-flatpak

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

flatpak install -y com.bitwarden.desktop # password manager
flatpak install -y org.blender.Blender # 3d software
flatpak install -y com.github.rafostar.Clapper # video player
flatpak install -y org.onlyoffice.desktopeditors # office suite
flatpak install -y com.discordapp.Discord # voice chat
flatpak install -y com.github.tchx84.Flatseal # flatpak configuration program
flatpak install -y org.kde.krita # image editor/ painting software
flatpak install -y com.obsproject.Studio # OBS
flatpak install -y com.spotify.Client # spotify
flatpak install -y com.valvesoftware.SteamLink # steam-link
flatpak install -y com.github.taiko2k.tauonmb # music player
flatpak install -y fr.handbrake.ghb # video transcoder

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

clear
notify-send -i emblem-default "flatpaks Script" "Done!"
echo "Done!"