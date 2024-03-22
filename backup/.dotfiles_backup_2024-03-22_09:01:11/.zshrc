export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="minimal"
zmodload zsh/zprof
zstyle ':omz:update' mode disabled  

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	copypath
	copybuffer
  sudo
)


source $ZSH/oh-my-zsh.sh

alias ls='exa --icons'
alias la='ls -a'
alias ld='ls -D'
alias py='python3'
alias wmc='xprop | grep WM_CLASS'
alias grep='grep -i'
alias vim='nvim'
alias vi='nvim'
alias ytaudio="yt-dlp -f 'ba' -x --no-playlist"
alias ytplaylist="yt-dlp -f 'ba' -x"
alias orange='redshift -P -O 4000' #num between 1000 and 25 000
alias dotfiles="bash ~/.config/qtile/scripts/dotfiles.sh"

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
export PATH=$JAVA_HOME/bin:$PATH
export EDITOR=/usr/bin/nvim
export XDG_CONFIG_HOME="$HOME/.config"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
