#!/bin/bash

# Set up variables
DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.dotfiles/backup/.dotfiles_backup_$(date +'%Y-%m-%d_%H:%M:%S')"

# Create dotfiles directory if it doesn't exist
mkdir -p "$DOTFILES_DIR"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Function to copy files
copy_files() {
    local source="$1"
    local dest="$2"

    if [ -e "$dest" ]; then
        echo "Backing up existing file: $dest"
        mv "$dest" "$BACKUP_DIR"
    fi

    echo "Copying $source to $dest"
    cp -r "$source" "$dest"
}

# Main function to copy files
main() {
    # Define your files and directories here
    declare -A files=(
        ["$HOME/.zprofile"]="zsh"
        ["$HOME/.zshrc"]="zsh"
        ["$HOME/wallOne.jpg"]="media"
        ["$HOME/.config/alacritty/"]="config"
        ["$HOME/.config/kitty/kitty.conf"]="config"
        ["$HOME/.config/emacs/"]="editor"
        ["$HOME/.config/nvim/"]="editor"
        ["$HOME/.config/qtile/arcobattery.py"]="rice"
        ["$HOME/.config/qtile/config.py"]="rice"
        ["$HOME/.config/qtile/icons"]="rice"
        ["$HOME/.config/qtile/rofi"]="rice"
        ["$HOME/.config/qtile/scripts"]="rice"
        ["$HOME/.config/qtile/sxhkd"]="rice"
        ["$HOME/.config/wal"]="rice"
        ["$HOME/.config/zathura"]="editor"
    )



 # Copy files to dotfiles directory
    for file in "${!files[@]}"; do
        if [ -e "$file" ] && [ "$file" != "$DOTFILES_DIR" ]; then
            # Extract the directory part of the destination path
            dest_dir="$DOTFILES_DIR/${files[$file]}"
            mkdir -p "$dest_dir"  # Create the destination directory if it doesn't exist
            copy_files "$file" "$dest_dir/$(basename "$file")"
        else
            echo "File not found or attempting to copy dotfiles directory: $file"
        fi
    done
}

# Call main function
main

