#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to install packages using pacman
install_pacman_packages() {
    echo "Installing Pacman packages..."
    sudo pacman -Syu --needed \
        neovim \
        qtile \
		picom \
        alacritty \
        kid3 \
        mpd \
        mpv \
        ncmpcpp \
        obsidian \
        unclutter \
        yt-dlp \
        zathura-pdf-mupdf \
        zsh \
        zsh-autosuggestions \
        zsh-doc \
        zsh-history-substring-search \
        timidity \
        zsh-syntax-highlighting
		nmap \
		gnu-netcat \
		masscan \
		openvas \
		pass \
		thunderbird \
		flameshot \
		brightnessctl \
		pulseaudio \
		pulseaudio-alsa \
}

# Function to install packages using yay
install_yay_packages() {
    echo "Installing Yay packages..."
    yay -S --needed \
        qtile-extras-git \
        python-pywal \
        disneyplus \
        python-mpd2 \
        oh-my-zsh-git \
        python-dbus-next \
        python-iwlib \
        eza \
        terminess-powerline-font-git \
        lua-jsregexp \
		vimv \
        xclip
}

setup_tldr() {
	mkdir -p ~/bin
	curl -o ~/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
	chmod +x ~/bin/tldr
}

setup_oh_my_zsh() {
    echo "Setting up Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

setup_mpd() {
    echo "Setting up MPD service..."
    sudo systemctl enable mpd
    sudo systemctl start mpd
}

# Function to check the status of previous commands
check_status() {
    if [ $? -eq 0 ]; then
        echo "All packages have been installed successfully and MPD service is set up."
    else
        echo "An error occurred during the installation or setting up of the MPD service."
        exit 1
    fi
}

# Main script execution
install_pacman_packages
install_yay_packages
setup_tldr
setup_oh_my_zsh
setup_mpd
check_status

