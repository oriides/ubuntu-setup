#!/bin/bash

sudo apt install -y flatpak

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y com.getpostman.Postman
flatpak install -y com.github.taiko2k.tauonmb
flatpak install -y com.slack.Slack
flatpak install -y md.obsidian.Obsidian
flatpak install -y org.blender.Blender
flatpak install -y org.onlyoffice.desktopeditors
flatpak install -y org.openttd.OpenTTD
flatpak install -y com.discordapp.Discord
flatpak install -y org.kde.krita

clear
notify-send -i emblem-default "flatpaks Script" "Done\!"
echo "Done\!"