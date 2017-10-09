#!/bin/bash

## INSTALL SCRIPT FOR UBUNTU MINIMAL

## Downloads the all of the programs I use
basic_programs ()
{
	cd ~/
	sudo apt update -qq
	sudo apt install -yy -q xorg vim rofi feh compton pulseaudio pavucontrol firefox scrot ranger thunar ubuntu-restricted-extras git software-properties-common w3m build-essential cmake automake checkinstall lxappearance gtk-chtheme qt4-qtconfig network-manager redshift alarm-clock-applet mpd mpc ncmpcpp zip gdebi htop fonts-takao xbacklight fcitx-mozc fcitx-libpinyin notify-osd

	#Installing the latest mpv
	sudo add-apt-repository ppa:mc3man/mpv-tests
	sudo apt update
	sudo apt install mpv
}

## Prompts the user if they would like to delete flash, mainly due to security concerns, after downloading all the basic programs.
## I have not learned how to install ubuntu-restricted-extras without flash yet so that will be done later on.
flash_delete ()
{
	echo "Would you like to delete flash? y/n"
	read input

	if [ "$input" = "y" ]
	then
		sudo apt purge --auto-remove flashplugin-installer -yy
	fi
	
	sudo apt -yy install gstreamer1.0-plugins-{base,good,bad,ugly} gstreamer1.0-libav ## Getting a youtube videos to work without flash

}

## Downloads the lastest stable version of i3wm for Ubuntu. Don't like the one in the regular repo since it can't use json. Bumblebee-status and Polybar
## use json so that is the reason for it.
i3_install ()
{
	clear
	## This chuck gets the lastest stable version of i3wm on ubuntu. Because that's the only way bumblebee-status will work tehe
	sudo /usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
	sudo apt install ./keyring.deb
	sudo su -c "echo 'deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe' >> /etc/apt/sources.list.d/sur5r-i3.list"
	sudo apt update -qq
	sudo apt install -yy i3

	#Install i3-gaps && it's dependencies
	sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm-dev -yy

	sudo add-apt-repository ppa:aguignard/ppa
	sudo apt update
	sudo apt-get install libxcb-xrm-dev -yy

	sudo apt upgrade

	cd
	git clone https://www.github.com/Airblader/i3 i3-gaps
	cd i3-gaps

	autoreconf --force --install
	rm -rf build/
	mkdir -p build && cd build/

	#Using checkinstall instead of make
	../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
	make
	sudo checkinstall
}

## I don't need all the python packages here. Haven't figured out which ones I don't need.
python_stuff ()
{
	sudo apt -yy install python3.5 python3-lxml python-tox python3-pyqt5 python3-pyqt5.qtwebkit python3-pyqt5.qtquick python3-sip python3-jinja2 python3-pygments python3-yaml python3-pip	## Installing python
	pip3 install mps-youtube youtube_dl

}

## Downloads all my fonts and my plugin manager for vim
git_stuff ()
{
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim	## Vim plugins
	
	git clone https://github.com/FortAwesome/Font-Awesome	## Installing FontAwesome and powerline fonts
	git clone https://github.com/powerline/fonts
	mkdir .fonts
	cp ~/Font-Awesome/fonts/FontAwesome.otf ~/.fonts/
	cp ~/fonts/DejaVuSansMono/DejaVu\ Sans\ Mono\ for\ Powerline.ttf ~/.fonts/
	cp ~/fonts/Inconsolata/Inconsolata\ for\ Powerline.otf ~/.fonts/
	rm -rf Font-Awesome fonts
}

## Downloads my terminal emulator termite
term ()
{
	cd ~/
	##Termite Install
	wget https://raw.githubusercontent.com/Corwind/termite-install/master/termite-install.sh
	chmod +x termite-install.sh
	./termite-install.sh
	rm termite-install.sh
}

## Downloads all dependencies for polybar and builds it from github.
polybar_install ()
{
	cd ~/
	sudo apt install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev -yy
	
	git clone --branch 3.0.5 --recursive https://github.com/jaagr/polybar
	mkdir polybar/build
	cd polybar/build
	cmake ..
	sudo make install
}

## Downloads all my configurations for my setup
confs ()
{
	##Getting configs
	git clone https://github.com/TeenCorn/UbuntuMini_i3wm.git
	cd UbuntuMini_i3wm/
	mkdir ~/.config
	mkdir ~/.config/i3
	cp -R .config/i3 ~/.config/
	cp -R .config/.mpd/ ~/.config/
	cp -R .config/.ncmpcpp/ ~/.config/
	cp -R .config/polybar/ ~/.config/
	cp -R .config/termite ~/.config/
	cp -R .config/ranger ~/.config/
	cp -R .config/.vimrc ~/
	wget https://raw.githubusercontent.com/TeenCorn/UbuntuMini_i3wm/master/wall.jpg
	mv wall.jpg ~/.config/
	cd .. && rm -rf UbuntuMini_i3wm/
}

basic_programs
flash_delete
i3_install
python_stuff
git_stuff
term
polybar_install
confs
cd ~/ && rm setup.sh
