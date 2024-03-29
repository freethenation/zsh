HISTFILE=~/.histfile
setopt hist_ignore_dups
setopt hist_verify
setopt inc_append_history
setopt extended_history
setopt interactivecomments
SAVEHIST=1000000000 # amount to store
HISTSIZE=10000 # amount to load into memory

bindkey -v
bindkey '^r' history-incremental-search-backward

# The following lines were added by compinstall
zstyle :compinstall filename "/home/$USER/.zshrc"
autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.zsh/fzf/fzf.zsh
#config terminals
if [ "$COLORTERM" = "gnome-terminal" ]; then
    export TERM=gnome-256color
fi

source ~/.zsh/clipboard.zsh
source ~/.zsh/copybuffer.plugin.zsh
source ~/.zsh/ls_colors.zsh
source ~/.zsh/auto_venv.zsh
source ~/.zsh/auto_node_bin.zsh
test -f "~/.zsh/local.sh" && source ~/.zsh/local.sh #for settings you never want checked into git
[[ -v ENABLE_SSH_AGENT ]] && source ~/.zsh/ssh-agent.plugin.zsh

command -v setxkbmap > /dev/null && setxkbmap -layout "us" -option caps:none #no caps lock

#config prompt
autoload -U colors && colors
abbr_working_dir(){
  echo "$PWD" | sed -e "s|^$HOME|~|" -e 's|\(\.\{0,1\}[^/]\)[^/]*/|\1/|g'
}
setopt PROMPT_SUBST
PROMPT="%{$fg[blue]%}%m:%c%{$reset_color%}%# "

_git_prompt() {
  local ref="$(command git symbolic-ref -q HEAD 2>/dev/null)"
  if [ -n "$ref" ]; then
    echo "branch:${ref#refs/heads/}"
  fi
}

RPS1="%{$fg[blue]%}ret:%? \$(_git_prompt)%{$reset_color%}"

#Fix paths
fpath=($HOME/.zsh/completions $fpath)
export GOPATH=/home/$USER/gopath
export PATH=$PATH:$HOME/bin:$HOME/.zsh/bin

#alias
alias curlj='curl -H "Content-Type: application/json"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
