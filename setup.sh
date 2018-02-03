#!/bin/bash

## INSTALL SCRIPT FOR UBUNTU MINIMAL

## Downloads the all of the programs I use
basic_programs ()
{
	cd ~/
	sudo apt update -qq
	echo 'deb http://repo.acestream.org/ubuntu/ trusty main' | sudo tee /etc/apt/sources.list.d/acestream.list
	sudo wget -O - http://repo.acestream.org/keys/acestream.public.key | sudo apt-key add -
	sudo apt-get update
	sudo apt-get install acestream-engine -yy
	## Pending: Anki, arc-theme, texlive
	sudo apt install -yy -q xorg vim rofi feh compton pulseaudio pavucontrol ranger thunar ubuntu-restricted-extras git software-properties-common w3m build-essential cmake automake checkinstall lxappearance gtk-chtheme qt4-qtconfig network-manager redshift alarm-clock-applet mpd mpc ncmpcpp zip gdebi htop fonts-takao xbacklight notify-osd xdotool wmctrl wine imagemagick zsh language-pack-zh-hant language-pack-zh-hans language-pack-ja fcitx clang libreoffice libreoffice-gtk pulseaudio-module-bluetooth bluez caca-utils highlight pandoc mediainfo openvpn rxvt-unicode-256color texlive curl anki lm-sensors mupdf neovim libpulse-dev

	#Installing the latest mpv
	sudo add-apt-repository ppa:mc3man/mpv-tests -y
	sudo apt update -yy
	sudo apt install mpv -yy

	sudo add-apt-repository ppa:tehtotalpwnage/ppa -yy
	sudo apt update -yy
	sudo apt install cava -yy

	sudo add-apt-repository ppa:dawidd0811/neofetch
	sudo apt update
	sudo apt install neofetch
}

## Prompts the user if they would like to delete flash, mainly due to security concerns, after downloading all the basic programs.
## I have not learned how to install ubuntu-restricted-extras without flash yet so that will be done later on.
flash_delete ()
{
	clear
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
	## This chuck gets the lastest stable version of i3wm on ubuntu.
	sudo /usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
	sudo apt install ./keyring.deb -y
	sudo su -c "echo 'deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe' >> /etc/apt/sources.list.d/sur5r-i3.list"
	sudo apt update -qq
	sudo apt install -yy i3

	#Install i3-gaps && it's dependencies
	sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm-dev -yy

	sudo add-apt-repository ppa:aguignard/ppa -y
	sudo apt update -y
	sudo apt-get install libxcb-xrm-dev -yy

	sudo apt upgrade -yy

	cd
	git clone https://www.github.com/Airblader/i3 i3-gaps
	cd i3-gaps

	autoreconf --force --install
	rm -rf build/
	mkdir -p build && cd build/

	../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
	make
	sudo make install
}

## I don't need all the python packages here. Haven't figured out which ones I don't need.
python_stuff ()
{
	sudo apt -yy install python3.5 python3-lxml python-tox python3-pyqt5 python3-pyqt5.qtwebkit python3-pyqt5.qtquick python3-sip python3-jinja2 python3-pygments python3-yaml python3-pip python-dev python3-dev	## Installing python
	pip3 install mps-youtube youtube_dl tox neovim

}

## Downloads all my fonts and my plugin manager for vim
git_stuff ()
{
	cd ~/
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim	## Vim plugins
	mkdir .antigen
	curl -L git.io/antigen > .antigen/antigen.zsh

	## Install browser; now default browser
	git clone https://github.com/qutebrowser/qutebrowser.git ~/.local/.qutebrowser
	cd ~/.local/.qutebrowser
	tox -e mkvenv-pypi
	cd ../bin
	touch qutebrowser && echo -e "#\!/bin/bash\n~/.local/.qutebrowser/.venv/bin/python3 -m qutebrowser \"\$@\"" > qutebrowser && chmod +x qutebrowser

	#Back for certain video types qutebrowser doesn't support
	cd ~/.local
	wget https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-55.2.2.en-US.linux-x86_64.tar.bz2
	tar -xjf waterfox-55.2.2.en-US.linux-x86_64.tar.bz2
	mv waterfox .waterfox
	ln -s ~/.local/.waterfox/waterfox ~/.local/bin/waterfox
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
	sudo apt install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev -yy

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
	cd ~/
	git clone https://github.com/TeenCorn/UbuntuMini_i3wm.git
	cd UbuntuMini_i3wm/
	mkdir ~/.config
	mkdir ~/.config/i3
	cp -R .config/i3 ~/.config/
	cp -R .config/mpd/ ~/.config/ && touch ~/.config/mpd/mpd.db ~/.config/mpd/mpd.log ~/.config/mpd/mpd.pid ~/.config/mpd/mpdstate
	cp -R .config/.ncmpcpp/ ~/
	cp -R .config/polybar/ ~/.config/
	cp -R .config/termite ~/.config/
	mv ~/.config/termite/nvimconfig ~/.vim/config
	cp -R .config/ranger ~/.config/
	cp -R .config/.vimrc ~/
	cp -R .config/nvim ~/.config/
	cp -R .fonts/ ~/
	cp -R .config/qutebrowser ~/.config
	cp -R .config/cava ~/.config
	cp .Xresources ~/
	cp .zshrc ~/
	cp .zprofile ~/
	cp .profile ~/
	wget https://raw.githubusercontent.com/TeenCorn/UbuntuMini_i3wm/master/wall.jpg
	mv wall.jpg ~/.config/
	cd .. && rm -rf UbuntuMini_i3wm/

	nvim +PlugInstall +qall
	xrdb .Xresources
	## Edit $PATH here
	sudo nvim /etc/zsh/zshenv
}

re ()
{
	clear
	echo "Want to reboot? y/n: "
	read option
	if [[ $option == "y" ]]
	then
		sudo reboot
	fi
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
chsh -s $(which zsh)
re
