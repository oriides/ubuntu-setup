#!/bin/bash

# sudo snap install android-studio --classic
sudo snap install code --classic
# sudo snap install intellij-idea-ultimate --classic
sudo snap install node --classic --edge

sudo snap refresh

clear
notify-send -i emblem-default "snaps Script" "Done\!"
echo "Done\!"
