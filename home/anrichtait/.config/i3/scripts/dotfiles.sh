#!/bin/bash

# Set up variables
DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.dotfiles/backup/.dotfiles_backup_$(date +'%Y-%m-%d_%H:%M:%S')"
LOG_FILE="$DOTFILES_DIR/missing_files.log"

# Create dotfiles directory if it doesn't exist
mkdir -p "$DOTFILES_DIR"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Create or clear the log file
> "$LOG_FILE"

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
    	# Terminal Stuff
        ["$HOME/.zprofile"]="term"
        ["$HOME/.zshrc"]="term"
        ["$HOME/.config/kitty/kitty.conf"]="term"
        ["$HOME/.config/alacritty/alacritty.toml"]="term"
	# Editor
        ["$HOME/.config/emacs/"]="editor"
        ["$HOME/.config/nvim/"]="editor"
        # Qtile
        ["$HOME/.config/qtile/arcobattery.py"]="qtile"
        ["$HOME/.config/qtile/config.py"]="qtile"
	# Rofi
        ["$HOME/.config/qtile/rofi/custom_launcher.sh"]="rofi"
        ["$HOME/.config/qtile/rofi/sands.jpg"]="rofi"
        ["$HOME/.config/qtile/rofi/sands.rasi"]="rofi"
        # i3 configuration files
        ["$HOME/.config/i3/scripts"]="i3"
        ["$HOME/.config/wal"]="i3"
        ["$HOME/.config/polybar"]="i3"
	# Misc
        ["$HOME/.config/zathura"]="misc"
        ["$HOME/wallOne.jpg"]="rice"
	# Scripts
        ["$HOME/.config/i3/scripts"]="scripts"
    )

    # Copy files to dotfiles directory
    for file in "${!files[@]}"; do
        if [ -e "$file" ] && [ "$file" != "$DOTFILES_DIR" ]; then
            dest_dir="$DOTFILES_DIR/${files[$file]}"
            mkdir -p "$dest_dir"  # Create the destination directory if it doesn't exist
            copy_files "$file" "$dest_dir/$(basename "$file")"
        else
            echo "File not found or attempting to copy dotfiles directory: $file"
            echo "$file" >> "$LOG_FILE"
        fi
    done

    # Print summary of missing files
    if [ -s "$LOG_FILE" ]; then
        echo "The following files were not found:"
        cat "$LOG_FILE"
    else
        echo "All specified files were found and copied successfully."
    fi
}

# Call main function
main

