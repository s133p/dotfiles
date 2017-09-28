export ZSH=/home/lukepurcell/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# ==============================================
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Aliases
# ==============================================
autoload -U zmv

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
        RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
            zle reset-prompt
        }

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
alias cls=clear
alias spp="spotify play"
alias sps="spotify pause"
alias sp="spotify"
alias spn="spotify next"
alias spvu="spotify vol up"
alias spvd="spotify vol down"
DEFAULT_USER=`whoami`
alias tmc="~/.tmuxgo"
alias tma="tmux a"
alias tmd="tmux detach-client"
alias tmx="tmux kill-session"
alias v='vim'
alias q="exit"

export TERM='xterm-256color'

# export GOPATH=$HOME/Documents/goproj
# export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:/usr/local/Cellar/clang-format/2016-12-09/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
