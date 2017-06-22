#!/bin/bash

## INSTALL SCRIPT FOR UBUNTU MINIMAL 

cd ~/
sudo apt-get update -qq			## Updates the packages so that you may install the lastest and greatest
sudo apt-get install -yy -q xorg vim rofi feh compton alsa-utils rxvt-unicode-256color firefox scrot ranger thunar ubuntu-restricted-extras git

sudo apt-get purge --auto-remove flashplugin-installer -yy

## This chuck gets the lastest stable version of i3wm on ubuntu. Because that's the only way bumblebee-status will work tehe
sudo /usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
sudo apt install ./keyring.deb
sudo echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
sudo apt-get update -qq
sudo apt-get install -yy i3

