source ~/.config/aliasrc

# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=100
SAVEHIST=100

bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/pazu/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Usability
unsetopt nomatch
bindkey -v '^?' backward-delete-char # backspace all
set +H

# VI modes have different cursors
zle-keymap-select () {
if [ $KEYMAP = vicmd ]; then
    printf "\033[2 q"
else
    printf "\033[6 q"
fi
}
zle -N zle-keymap-select
zle-line-init () {
zle -K viins
printf "\033[6 q"
}
zle -N zle-line-init
bindkey -v

# FZF autocomplete
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
bindkey '^P' fzf-file-widget

# POWERLINE 
#function powerline_precmd() {
#    PS1="$(powerline-shell --shell zsh $?)"
#}
#
#function install_powerline_precmd() {
#  for s in "${precmd_functions[@]}"; do
#    if [ "$s" = "powerline_precmd" ]; then
#      return
#    fi
#  done
#  precmd_functions+=(powerline_precmd)
#}
#
#if [ "$TERM" != "linux" ]; then
#    install_powerline_precmd
#fi
#
source ~/powerlevel10k/powerlevel10k.zsh-theme
