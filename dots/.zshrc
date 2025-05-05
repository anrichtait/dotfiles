# === PATH Configurations ===
export PATH="$HOME/.local/bin:/home/anrichtait/.dotnet/tools:$HOME/bin:$HOME/scripts:/usr/local/bin:$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=/usr/bin/emacs
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC

eval "$(starship init zsh)"

# === Aliases ===
alias cat='bat'
alias ls='exa --icons'
alias la='exa -a --icons'
alias ld='exa -D --icons'
alias cp='cp -i'				# confirm before overwriting
alias df='df -h'				# human readable sizes
alias py='python3'
alias xprop='xprop | grep WM_CLASS'
alias grep='grep -i'
alias ytaudio="yt-dlp -f 'ba' -x --no-playlist"
alias ytplaylist="yt-dlp -f 'ba' -x"
alias dotfiles="bash ~/.config/i3/scripts/dotfiles.sh"
alias ipod='ncmpcpp'
alias libgen='libgen -e "pdf,epub" search'
alias serve='bundle exec jekyll serve'
alias scratch='nvim ~/scratch.md'
alias term='(alacritty --working-directory "$(pwd)" &) & disown'
alias zshrc='nvim ~/.zshrc'
alias spacein='dust'
alias hx='helix'
alias mountex='sudo mount -t ntfs-3g /dev/sda1 /mnt/external'

# === Misc Setting ===

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit light hlissner/zsh-autopair

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust


autoload -Uz +X compinit && compinit

## case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

export WASI_SDK_PATH=~/wasi-sdk
export PATH=$WASI_SDK_PATH/bin:$PATH

export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
