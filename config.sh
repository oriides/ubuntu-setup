#!/bin/bash

# create home tmp folder
mkdir ~/tmp

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# configure git ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

## git user.name
if ! NAME=$(zenity --entry --title "GIT User Name" --text "Please enter your name (Firstname Lastname):"); then
  notify-send -i dialog-error "Aborting..." "Please enter your Name to continue"
  exit;
fi

## git user.email
if ! EMAIL=$(zenity --entry --title "GIT User Email" --text "Please enter your Email adress:"); then
  notify-send -i dialog-error "Aborting..." "Please enter your Email to continue"
  exit;
fi

## globally sets git username and email
git config --global user.name $NAME
git config --global user.email $EMAIL

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# set up various configurations ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

## sets up vim
cp $(dirname $(readlink -f $0))/configs/.vimrc ~/

## sets up PulseEffects Presets
mkdir -p ~/.config/PulseEffects/output/
mkdir -p ~/.config/PulseEffects/input/
cp $(dirname $(readlink -f $0))/configs/PulseEffects-input/*.json ~/.config/PulseEffects/input/
cp $(dirname $(readlink -f $0))/configs/PulseEffects-output/*.json ~/.config/PulseEffects/output/

## sets up cronjobs
sudo cp $(dirname $(readlink -f $0))/cronjobs/daily/* /etc/cron.daily/

## install .desktop files
cp $(dirname $(readlink -f $0))/configs/desktop-files/* ~/.local/share/applications

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# install fonts ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

## Montserrat
wget -O Montserrat.zip https://fonts.google.com/download\?family\=Montserrat
unzip Montserrat.zip -d Montserrat
sudo chown -R root:root Montserrat
sudo mv Montserrat /usr/share/fonts/truetype/
fc-cache -vf

## Powerline Symbols
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf /usr/share/fonts/
fc-cache -vf /usr/share/fonts/
mv 10-powerline-symbols.conf /etc/fonts/conf.d/

## Meslo Nerd Font (for Powerlevel10k)
mkdir MesloLGS-NF
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O MesloLGS-NF/MesloLGS-NF-Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O MesloLGS-NF/MesloLGS-NF-Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O MesloLGS-NF/MesloLGS-NF-Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O MesloLGS-NF/MesloLGS-NF-Bold-Italic.ttf
sudo chown -R root:root MesloLGS-NF
sudo mv MesloLGS-NF /usr/share/fonts/truetype/
fc-cache -vf

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# configure zsh ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

## install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Powerlevel10k for oh-my-zsh
zsh "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

## zsh autosuggestions
zsh "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

## modify .zshrc to enable theme and plugins
sed -i 's,ZSH_THEME=.*,ZSH_THEME="powerlevel10k/powerlevel10k",g' ~/.zshrc
sed -i 's,plugins=(git),plugins=(git docker docker-compose zsh-autosuggestions),g' ~/.zshrc

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# usability fixes ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

# OBSOLETE
# ## removes screen tearing when using nvidia's proprietary graphics drivers (requires reboot to take effect)
# sudo touch /etc/modprobe.d/nvidia-drm-nomodeset.conf
# sudo echo "options nvidia-drm modeset=1" >> /etc/modprobe.d/nvidia-drm-nomodeset.conf
# sudo update-initramfs -u

## week starts at monday fix for cal
echo "" >> ~/.config/fish/config.fish
echo "# Fix for cal, so that week starts at Monday" >> ~/.config/fish/config.fish
echo "alias cal='ncal -Mb'" >> ~/.config/fish/config.fish

echo "" >> ~/.zshrc
echo "# Fix for cal, so that week starts at Monday" >> ~/.zshrc
echo "alias cal='ncal -Mb'" >> ~/.zshrc

## install my custom icon theme
git clone git@github.com:sovareign/WinOSX-dark.git
sudo mv WinOSX-dark /usr/share/icons/

# configure evolution ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

## set labels
gsettings set org.gnome.evolution.mail labels "['I_mportant:#EF2929', '_Work:#F57900', '_Personal:#4E9A06', '_To Do:#3465A4', '_Later:#75507B', 'via Amazon:#6666AA|amazon', 'via Saturn:#6666AA|via_saturn', 'via Zalando:#6666AA|via_zalando', 'via Twitch:#6666AA|via_twitch', 'via IONOS:#6666AA|via_ionos', 'via 7digital:#6666AA|via_7digital', 'via Archive.org:#6666AA|via_archive.org', 'via dbrand:#6666AA|via_dbrand', 'via Discord:#6666AA|via_discord', 'via EA:#6666AA|via_ea', 'via MediaMarkt:#6666AA|via_mediamarkt', 'via Parsec:#6666AA|via_parsec', 'via TeamSpeak:#6666AA|via_teamspeak', 'via Steam:#6666AA|via_steam', 'via Bahn:#6666AA|via_bahn', 'via WB:#6666AA|via_wb', 'via Blizzard:#6666AA|via_blizzard', 'via Epic:#6666AA|via_epic', 'via Rockstar:#6666AA|via_rockstar', 'via itch.io:#6666AA|via_itch.io', 'via Humble:#6666AA|via_humble']"

## set mail filters
if ! MAIL=$(zenity --entry --title "How does your Email start?" --text "…@gmail.com:"); then
  notify-send -i dialog-error "Aborting..." "Please enter your Email to continue"
  exit;
fi

sed -i "s,REDACTED,$MAIL,g" $(dirname $(readlink -f $0))/configs/filters.xml

cp $(dirname $(readlink -f $0))/configs/filters.xml ~/.config/evolution/mail/filters.xml

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

## Place todo File in Home directory
mv $(dirname $(readlink -f $0))/todos.md ~/

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

notify-send -i dialog-information "config Script" "Please reboot to apply all changes and consult the todo file in your Home Directory"

clear
notify-send -i emblem-default "config Script" "Done!"
echo "Done!"
