# My Ubuntu minimal i3wm Install

![pic1](pic1.png)

## Setup.sh
Once Ubuntu minimal finishes installing, wget https://raw.githubusercontent.com/TeenCorn/UbuntMini_i3wm/master/setup.sh, chmod 777 setup.sh, and let it do its magic!

## Programs Installed

+ i3wm (The latest stable build. NOT the one from the Ubuntu repository. This one can use json)
+ termite (I don't like urxvt configuration)
+ vim
+ ranger
+ mpv (Video player)
+ Thunar (So phones and usb can be mounted automatically)
+ feh (For bg)
+ compton (Transperancy)
+ pulseaudio (Can't use alsa because of my sound card on my desktop :( !Will be adding alsa option later)
+ scrot (For moneyshots)
+ w3m (For ranger image viewing)
+ lxappearance (To change themes easly)
+ network-manager (Conveniently connect to the internet)
+ redshift (So my eye won't bleed at night)
+ mpd, mpc, and ncmpcpp (Terminal music player)
+ gdebi (Convinently install deb packages)
+ mpsyt (For terminal youtube viewing)

## Fonts

+ Font Awesome (For workspace icons etc)
+ Inconsolata for Powerline (Terminal font)
+ DejaVu Sans Mono for Powerline (Actually not sure why I have this one?)

## Options
The setup.sh script ask you whether or not you would like to uninstall Flash from your computer since it's automatically installed with ubuntu-restricted-extras. REGARDLESS of what choice you make, y/n, the script will install gstreamer1.0-plugins-{bad,good,ugly,base}. I do this because I will eventually get rid of it later and so I won't have to install gstreamer manually later on. I only have flash because I need it for a website for my class.
