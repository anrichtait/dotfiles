#!/bin/zsh

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
BOLD=$(tput bold)
RESET=$(tput sgr0)

DEBUG=1
debug() {
    if [ "$DEBUG" -eq 1 ]; then
        echo "${YELLOW}[DEBUG] $1${RESET}"
    fi
}

BACKUP_ROOT="$HOME/Projects/dotfiles"
DOTS_DIR="$BACKUP_ROOT/dots"

echo "${BLUE}${BOLD}Starting dotfiles backup...${RESET}"

if mkdir -p "$DOTS_DIR"; then
    echo "${GREEN}Backup directory created: $DOTS_DIR${RESET}"
else
    echo "${RED}Error: Unable to create backup directory: $DOTS_DIR${RESET}" >&2
    exit 1
fi

declare -a files_to_copy=(
    "$HOME/.zshrc"
    "$HOME/.doom.d/"
    "$HOME/.config/alacritty/alacritty.yml"
    "$HOME/.config/i3/"
    "$HOME/.config/nvim/"
    "$HOME/.config/picom/"
    "$HOME/.config/polybar/"
    "$HOME/.config/dunst/"
    "$HOME/.config/qtile/"
    "$HOME/.config/zathura/"
    "$HOME/.config/starship.toml"
    "$HOME/.config/kitty/"
)

copy_files() {
    for item in "${files_to_copy[@]}"; do
        debug "Processing item: $item"
        if [ -e "$item" ]; then
            relative_path="${item#$HOME/}"
            destination="$DOTS_DIR/$relative_path"
            debug "Relative path: $relative_path"
            mkdir -p "$(dirname "$destination")"
            if cp -r "$item" "$destination"; then
                echo "${GREEN}Copied: $item -> $destination${RESET}"
            else
                echo "${RED}Error copying $item to $destination${RESET}" >&2
            fi
        else
            echo "${YELLOW}Warning: $item does not exist!${RESET}"
        fi
    done
}

copy_files

echo "${BLUE}${BOLD}Dotfiles backup completed!${RESET}"
