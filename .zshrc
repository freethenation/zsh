HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v

# The following lines were added by compinstall
zstyle :compinstall filename '/home/freethenation/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#config terminals
if [ "$COLORTERM" = "gnome-terminal" ]; then
    export TERM=gnome-256color
fi

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
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
