export PATH=$HOME/bin/.local/bin:/usr/local/bin:$HOME/bin:$HOME/scripts:$PATH
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=/usr/bin/emacs-29.3
export XDG_CONFIG_HOME="$HOME/.config"
export DEVKITARM=/opt/devkitpro/devkitARM
export DOOMDIR=$HOME/.doom.d

ZSH_THEME="minimal"
zstyle ':omz:update' mode disabled  # disable automatic updates

plugins=(
	git
	zsh-autosuggestions
	colorize
	history-substring-search
	sudo
	git
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
alias decomp="cd ~/Projects/decomps/"
alias teste="mgba-qt /home/anrichtait/Projects/decomps/pokeemerald-expansion-noot-base/pokeemerald.gba"
alias extscr="xrandr --output eDP-1 --auto --same-as HDMI-2"
alias porymap="nohup /home/anrichtait/Projects/decomps/tools/porymap/porymap > /dev/null 2>&1 &"
alias se='nohup mono ~/Applications/SE/SubtitleEdit.exe >/dev/null 2>&1 &'
alias make='make -j' #remember to include the number returned by nproc

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
