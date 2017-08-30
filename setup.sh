#!/bin/bash

## INSTALL SCRIPT FOR UBUNTU MINIMAL

cd ~/
sudo apt-get update -qq			## Updates the packages so that you may install the lastest and greatest
sudo apt-get install -yy -q xorg vim rofi feh compton pulseaudio pasystray pavucontrol firefox scrot ranger thunar ubuntu-restricted-extras git software-properties-common w3m mpv build-essential automake checkinstall lxappearance gtk-chtheme qt4-qtconfig network-manager redshift-gtk alarm-clock-applet mpd moc ncmpcpp zip

sudo apt-get purge --auto-remove flashplugin-installer -yy
sudo apt-get -yy install gstreamer1.0-plugins-{base,good,bad,ugly} gstreamer1.0-libav ## Getting a youtube videos to work without flash

## This chuck gets the lastest stable version of i3wm on ubuntu. Because that's the only way bumblebee-status will work tehe
sudo /usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
sudo apt install ./keyring.deb
sudo echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
sudo apt-get update -qq
sudo apt-get install -yy i3

sudo apt-get -yy install python3.5 python3-lxml python-tox python3-pyqt5 python3-pyqt5.qtwebkit python3-pyqt5.qtquick python3-sip python3-jinja2 python3-pygments python3-yaml python3-pip	## Installing python

sudo apt-get -yy install python-netifaces python-psutil python-requests -y 		## Dependencies needed to get Bumblebee-status running

pip3 install mps-youtube youtube_dl

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim	## Vim plugins

git clone https://github.com/FortAwesome/Font-Awesome	## Installing FontAwesome and powerline fonts
git clone https://github.com/powerline/fonts

mkdir .fonts
cp ~/Font-Awesome/fonts/FontAwesome.otf ~/.fonts/
cp ~/fonts/DejaVuSansMono/DejaVu\ Sans\ Mono\ for\ Powerline.ttf ~/.fonts/
cp ~/fonts/Inconsolata/Inconsolata\ for\ Powerline.otf ~/.fonts/

rm -rf Font-Awesome fonts

##Termite Install
wget https://raw.githubusercontent.com/Corwind/termite-install/master/termite-install.sh
chmod +x termite-install.sh
./termite-install.sh

##Getting configs
wget https://raw.githubusercontent.com/TeenCorn/UbuntMini_i3wm/master/config https://raw.githubusercontent.com/TeenCorn/UbuntMini_i3wm/master/.vimrc https://raw.githubusercontent.com/TeenCorn/UbuntMini_i3wm/master/termite.config
