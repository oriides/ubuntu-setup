#!/bin/bash

# git user.name
if ! NAME=$(zenity --entry --title "GIT User Name" --text "Please enter your name (Firstname Lastname):"); then
  notify-send -i dialog-error "Aborting..." "Please enter your Name to continue"
  exit;
fi

#git user.email
if ! EMAIL=$(zenity --entry --title "GIT User Email" --text "Please enter your Email adress:"); then
  notify-send -i dialog-error "Aborting..." "Please enter your Email to continue"
  exit;
fi

# globally sets git username and email
git config --global user.name $NAME
git config --global user.email $EMAIL

# set zsh as default shell
chsh -s /bin/zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k for oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's,ZSH_THEME=.*,ZSH_THEME="powerlevel10k/powerlevel10k",g' ~/.zshrc

# OBSOLETE:

# Powerline
# pip3 install powerline-status

# wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
# wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

# mv PowerlineSymbols.otf /usr/share/fonts/
# fc-cache -vf /usr/share/fonts/
# mv 10-powerline-symbols.conf /etc/fonts/conf.d/

# sets up Powerline for bash
# echo "" >> ~/.bashrc
# echo "# Powerline" >> ~/.bashrc
# echo "powerline-daemon -q" >> ~/.bashrc
# echo "POWERLINE_BASH_CONTINUATION=1" >> ~/.bashrc
# echo "POWERLINE_BASH_SELECT=1" >> ~/.bashrc
# echo ". /usr/share/powerline/bindings/bash/powerline.sh" >> ~/.bashrc

# sets up Powerline for zsh
# echo "" >> ~/.zshrc
# echo "# Powerline" >> ~/.zshrc
# echo ". /usr/share/powerline/bindings/zsh/powerline.zsh" >> ~/.zshrc

# sets up vim
cp $(dirname $(readlink -f $0))/configs/.vimrc ~/

# sets up PulseEffects Presets
mkdir -p ~/.config/PulseEffects/output/
mkdir -p ~/.config/PulseEffects/input/
cp $(dirname $(readlink -f $0))/configs/PulseEffects-input/*.json ~/.config/PulseEffects/input/
cp $(dirname $(readlink -f $0))/configs/PulseEffects-output/*.json ~/.config/PulseEffects/output/

# sets up cronjobs
mkdir ~/tmp
sudo cp $(dirname $(readlink -f $0))/cronjobs/daily/* /etc/cron.daily/

# removes screen tearing when using nvidia's proprietary graphics drivers (requires reboot to take effect)
#sudo touch /etc/modprobe.d/nvidia-drm-nomodeset.conf
#sudo echo "options nvidia-drm modeset=1" >> /etc/modprobe.d/nvidia-drm-nomodeset.conf
#sudo update-initramfs -u

# week starts at monday fix for cal
echo "" >> ~/.zshrc
echo "# Fix for cal, so that week starts at Monday" >> ~/.zshrc
echo "alias cal='ncal -Mb'" >> ~/.zshrc

# install Montserrat Google Font
wget -O Montserrat.zip https://fonts.google.com/download\?family\=Montserrat
unzip Montserrat.zip -d Montserrat
mv Montserrat /usr/share/fonts/truetype/

# install now clocking conky widget
git clone git@github.com:rayzr522/now-clocking.git
sudo mv now-clocking /opt/
sudo /opt/now-clocking/scripts/download-fonts.sh
echo "[Desktop Entry]\nTerminal=false\nType=Application\nName=Now Clocking\nExec=/opt/now-clocking/now-clocking" > ~/.local/share/applications/now-clocking.desktop
ln -s ~/.local/share/applications/now-clocking.desktop ~/.config/autostart/now-clocking.desktop

notify-send -i dialog-information "config Script" "Please reboot to apply all changes"

clear
notify-send -i emblem-default "config Script" "Done\!"
echo "Done\!"
