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

# OBSOLETE
## install now clocking conky widget
# git clone git@github.com:rayzr522/now-clocking.git
# sudo mv now-clocking /opt/
# sudo /opt/now-clocking/scripts/download-fonts.sh
# sudo cp /opt/now-clocking/start.sh /opt/now-clocking/now-clocking
# sudo chmod +x /opt/now-clocking/now-clocking

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
# configure fish ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

## install fisher
fish "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

## install tide powerline prompt
fish "fisher install ilancosman/tide"

## install fzf for backwards search
fish "fisher install jethrokuan/fzf"

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

## removes screen tearing when using nvidia's proprietary graphics drivers (requires reboot to take effect)
sudo touch /etc/modprobe.d/nvidia-drm-nomodeset.conf
sudo echo "options nvidia-drm modeset=1" >> /etc/modprobe.d/nvidia-drm-nomodeset.conf
sudo update-initramfs -u

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

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

## Place todo File in Home directory
mv $(dirname $(readlink -f $0))/todos.txt ~/

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

notify-send -i dialog-information "config Script" "Please reboot to apply all changes and consult the todo file in your Home Directory"

clear
notify-send -i emblem-default "config Script" "Done!"
echo "Done!"
