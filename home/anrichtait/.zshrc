# === PATH Configurations ===
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:/home/anrichtait/.dotnet/tools:$HOME/bin:$HOME/scripts:/usr/local/bin:$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export DEVKITARM=/opt/devkitpro/devkitARM
export EDITOR=/usr/bin/nvim
export TLDR_HEADER='magenta bold underline'
export TLDR_QUOTE='italic'
export TLDR_DESCRIPTION='green'
export TLDR_CODE='red'
export TLDR_PARAM='blue'

eval "$(starship init zsh)"

# === Aliases ===
alias ls='exa --icons'
alias la='exa -la --icons'
alias ld='exa -D --icons'
alias py='python3'
alias xprop='xprop | grep WM_CLASS'
alias grep='grep -i'
alias ytaudio="yt-dlp -f 'ba' -x --no-playlist"
alias ytplaylist="yt-dlp -f 'ba' -x"
alias dotfiles="bash ~/.config/i3/scripts/dotfiles.sh"
alias ipod='ncmpcpp'
alias pls='pass ls'
alias pshow='pass show'
alias pgen='pass generate'
alias libgen='libgen -e "pdf,epub" search'
alias serve='bundle exec jekyll serve'
alias scratch='nvim ~/scratch.md'
alias term='(alacritty --working-directory "$(pwd)" &) & disown'
alias cdr='cd ~/Projects/rustlings/exercises/'
alias zshrc='nvim ~/.zshrc'

HISTFILE=~/.zsh_history          
HISTSIZE=10000
SAVEHIST=10000          
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Show command duration for commands that take longer than 2 seconds
RPROMPT='%F{yellow}[%T] %F{cyan}[%D{%H:%M:%S}] %F{white}%F{green}$? %F{white}%*'


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

# Add environment variable AX_ROOT for axmol
export AX_ROOT="/home/anrichtait/Applications/axmol"
# Add axmol cmdline tool to PATH
export PATH=$AX_ROOT/tools/cmdline:$PATH
