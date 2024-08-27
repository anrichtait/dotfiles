#!/bin/bash

echo "Pacman packages will now install."

sudo pacman -Syu --needed \
	neovim \
	qtile \
	alacritty \
	kid3 \
	mpd \
	mpv \
	ncmpcpp \
	obsidian \
	unclutter \
	yt-dlp \
	zathura-pdf-mupdf \
	zsh-autosuggestions \
	zsh-doc \
	zsh-history-substring-search \
	zsh-syntax-highlighting \

yay -S 	qtile-extras-git
yay -S  disneyplus 
yay -S  oh-my-zsh-git
yay -S  python-dbus-next
yay -S  python-iwlib

if [ $? -eq 0 ]; then
    echo "All packages have been installed successfully."
else
    echo "An error occurred during the installation."
    exit 1
fi
