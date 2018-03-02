# My Ubuntu minimal i3wm Install

![pic1](pic1.png)

## Setup.sh
	$ wget https://raw.githubusercontent.com/TeenCorn/UbuntMini_i3wm/master/setup.sh && chmod +x setup.sh

Let it do it's magick

Keep checking back on it while it installs because EULAs and options will pop up from time to time

## $PATH
Currently, one of last things done is changing the $PATH variable in /etc/zsh/zshenv

From:

	export PATH="/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/games"

To:

	export path="/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/games:$home/.local/bin"

This is done manually :(

Todo:  Figure out how to do this automatically with bash later

## Fonts

+ Terminess Nerd Font

## Options
The setup.sh script ask you whether or not you would like to uninstall **Flash** from your computer since it's automatically installed with ubuntu-restricted-extras. 

**REGARDLESS** of the choice you make, y/n, the script will install gstreamer1.0-plugins-{bad,good,ugly,base}. I do this because I will eventually get rid of it later and so I won't have to install gstreamer manually later on. I only have flash because I need it for a website for my class.

#### Gaps
By default gaps are turned off but can be activated with

	alt+g

To turn off gaps

	Shift+alt+g

#### Polybar configs
