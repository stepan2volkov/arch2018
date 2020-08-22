#!/bin/bash
echo 'Установка AUR (yay)'
sudo pacman -Syu
sudo pacman -S wget --noconfirm
wget git.io/yay-install.sh && sh yay-install.sh --noconfirm

echo 'Создаем нужные директории'
sudo pacman -S xdg-user-dirs --noconfirm
xdg-user-dirs-update

echo 'Установка базовых программ и пакетов'
sudo pacman -S ufw f2fs-tools dosfstools ntfs-3g alsa-lib alsa-utils file-roller p7zip unrar gvfs aspell-ru pulseaudio pavucontrol --noconfirm

sudo pacman -Sy --noconfirm xorg-dev build-essential libx11-dev x11proto-xext-dev 

echo 'Установка остальных программ и пакетов'
sudo pacman -S --noconfirm base-devel xwinwrap xautolock polybar i3 i3-gaps i3lock-color rofi okular feh vim code picom kitty ranger git xdotool scrot redshift

# Cloning repository
git clone https://github.com/us3rn4me-profile/GreatI3.git
# Changing directory
cd GreatI3
# Copying main configs for urxvt and zsh
cp zshrc $HOME/.zshrc
cp Xresources $HOME/.Xresources
# Copying fonts
mkdir -p $HOME/.local/share/fonts/ && \
cp fonts/* $HOME/.local/share/fonts/ && \
fc-cache -vf
# Copying config for touchpad
cp ./config/* $HOME/.config/ -r && sudo cp ./40-libinput.conf /usr/share/X11/xorg.conf.d/40-libinput.conf
# Copying scripts
cp ./scripts/* $HOME/.config/i3/ -r

# Build Polybar

# Build XWinWrap
sudo pacman -Sy --noconfirm xorg-dev build-essential libx11-dev x11proto-xext-dev libxrender-dev libxext-dev gifsicle
git clone https://github.com/ujjwal96/xwinwrap.git $HOME/gitinstalled/xwinwrap
cd xwinwrap
make
sudo make install
make clean
cd ../
rm -rf xwinwrap

echo 'Установка завершена! Перезагрузите систему.'
