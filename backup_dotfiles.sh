#!/bin/zsh

# Define the dotfiles directory
DOTFILES_DIR="$HOME/Documents/dotfiles/"

# Create the dotfiles directory if it doesn't exist
mkdir -p "$DOTFILES_DIR"

# List of files/folders to copy
declare -a files_to_copy=(
    "$HOME/.zshrc"
	"$HOME/.config/alacritty/alacritty.yml"
	"$HOME/.config/i3/"
	"$HOME/.config/mpd/"
	"$HOME/.config/ncmpcpp/"
    "$HOME/.config/nvim/"
	"$HOME/.config/picom/"
    "$HOME/.config/polybar/"
    "$HOME/.config/wal/"
    "$HOME/.config/dunst/"
    "$HOME/.config/ncmpcpp/"
    "$HOME/.config/qtile/"
    "$HOME/.config/zathura/"
)

# Function to copy files and folders
copy_files() {
    for item in "${files_to_copy[@]}"; do
        if [ -e "$item" ]; then
            # Copy files and folders preserving the directory structure
            cp -r --parents "$item" "$DOTFILES_DIR"
            echo "Copied $item to $DOTFILES_DIR"
        else
            echo "Warning: $item does not exist!"
        fi
    done
}

# Run the copy function
copy_files

# Confirm completion
echo "Dotfiles backup completed!"

