HISTFILE=~/.histfile
setopt hist_ignore_dups
#setopt hist_expire_dups_first
setopt hist_verify
setopt inc_append_history
setopt extended_history
setopt interactivecomments

SAVEHIST=1000000000 # amount to store
HISTSIZE=10000 # amount to load into memory

bindkey -v
bindkey '^r' history-incremental-search-backward

# The following lines were added by compinstall
zstyle :compinstall filename '/home/freethenation/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.zsh/fzf/fzf.zsh
#config terminals
if [ "$COLORTERM" = "gnome-terminal" ]; then
    export TERM=gnome-256color
fi

source ~/.zsh/ls_colors.zsh
source ~/.zsh/auto_venv.zsh
source ~/.zsh/auto_node_bin.zsh

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

export ANDROID_HOME="/home/freethenation/bin/android/sdk"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export NVM_DIR="/home/freethenation/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
