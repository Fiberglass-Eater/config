# Use antibody for plugins (https://getantibody.github.io/)
source $XDG_CONFIG_HOME/zsh/zsh_plugins.sh

# Source my prompt 
. '/home/dom/sys/config/zsh/prompt.sh'

# Setup alias's for common commands.
alias v="nvim"
alias z="zathura"
alias f="feh"
alias xup="doas xbps-install -Su xbps && doas xbps-install -u && doas xbps-remove -O && doas makewhatis /usr/share/man && doas kernal-clearing"
alias xrm="doas xbps-remove -o &&  doas xbps-remove -oy"
alias xs="doas xbps-query -Rs"
alias ls="ls -Al --color=auto"
alias make="make -j$(nproc)"
alias cds="cd $HOME/edu"
alias t="trans"
alias cdc="cd $HOME/sys/config/"
#alias startx="\/usr/bin/nohup \/usr/bin/startx & exit"

# Setup vi mode and its keybindings

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
   VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
   zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=1

# Setup tab completion
autoload -Uz compinit && compinit
# Case insesitvie completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

