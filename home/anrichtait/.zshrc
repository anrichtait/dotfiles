export PATH=$HOME/bin/.local/bin:/usr/local/bin:$HOME/bin:$HOME/scripts:$PATH
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=/usr/bin/nvim
export XDG_CONFIG_HOME="$HOME/.config"
export DEVKITARM=/opt/devkitpro/devkitARM
export DOOMDIR=$HOME/.doom.d

ZSH_THEME="minimal"
zstyle ':omz:update' mode disabled  # disable automatic updates

plugins=(
	git
	colorize
	history-substring-search
	sudo
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	)

source $ZSH/oh-my-zsh.sh

alias ls='exa --icons'
alias la='ls -a'
alias ld='ls -D'
alias py='python3'
alias xprop='xprop | grep WM_CLASS'
alias grep='grep -i'
alias ytaudio="yt-dlp -f 'ba' -x --no-playlist"
alias ytplaylist="yt-dlp -f 'ba' -x"
alias dotfiles="bash ~/.config/i3/scripts/dotfiles.sh"
alias ipod='ncmpcpp'


# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
