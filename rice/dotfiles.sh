#!/bin/bash

# Set up variables
DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +'%Y%m%d_%H%M%S')"
REPO_URL="https://github.com/your_username/dotfiles.git"  # Replace with your GitHub repo URL

# Create dotfiles directory if it doesn't exist
mkdir -p "$DOTFILES_DIR"

# Function to copy or link files
copy_or_link() {
    local source="$1"
    local dest="$2"

    if [ -e "$dest" ]; then
        echo "Backing up existing file: $dest"
        mv "$dest" "$BACKUP_DIR"
    fi

    echo "Copying $source to $dest"
    cp "$source" "$dest"
}

# Function to group files
group_files() {
    local file="$1"
    local group="$2"

    mkdir -p "$DOTFILES_DIR/$group"
    copy_or_link "$file" "$DOTFILES_DIR/$group/$(basename "$file")"
}

# Main function to copy and group files
main() {
    # Define your files and groups here
    declare -A directories=(
		["$HOME/.zprofile"]="zsh"
		["$HOME/.zshrc"]="zsh"
		["$HOME/wallOne.jpg"]="media"
		["$HOME/.config/alacritty/alacritty.toml"]="config"
		["$HOME/.config/kitty/kitty.conf"]="config"
		["$HOME/.config/nvim/"]="editor"
		["$HOME/.config/emacs/init.el"]="editor"
		["$HOME/.config/qtile/arcobattery.py"]="rice"
		["$HOME/.config/qtile/config.py"]="rice"
		["$HOME/.config/qtile/icons/"]="rice"
		["$HOME/.config/qtile/rofi/"]="rice"
		["$HOME/.config/qtile/scripts/"]="rice"
		["$HOME/.config/qtile/sxhkd/"]="rice"
		["$HOME/.config/wal/"]="rice"
		["$HOME/.config/zathura/"]="editor"
        ["$HOME/.config"]="config"
        # Add more directories and groups as needed
    )

    # Copy or link files from directories to dotfiles directory
    for dir in "${!directories[@]}"; do
        for file in "$dir"/*; do
            group_files "$file" "${directories[$dir]}"
        done
    done

    # Initialize Git repository if not already initialized
    if [ ! -d "$DOTFILES_DIR/.git" ]; then
        echo "Initializing Git repository..."
        git -C "$DOTFILES_DIR" init
        git -C "$DOTFILES_DIR" remote add origin "$REPO_URL"
    fi

    # Commit changes
    git -C "$DOTFILES_DIR" add .
    git -C "$DOTFILES_DIR" commit -m "Initial commit"

    # Push to GitHub
    git -C "$DOTFILES_DIR" push -u origin master
}

# Call main function
main

