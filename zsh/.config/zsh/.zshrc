# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_SAVE_NO_DUPS

EDITOR_PROG='nvim'

# Sets vim mode
bindkey -v
export KEYTIMEOUT=1

# Vim keybinds in menu selection
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$ZDOTDIR/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

# Show a selection menu when multiple options are available
zstyle ':completion:*' menu select

# Use colors in completion menus
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


# Group and describe completions
export SHELL=/usr/bin/zsh
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'

# Case-insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# End of lines added by compinstall

[[ $- != *i* ]] && return

alias ls='ls -a --color=auto'
alias ll='ls -l'
alias lla='ls -la'
alias grep='grep --color=auto'

# Config editing aliases
alias hyprconf='${EDITOR_PROG} ~/.config/hypr/hyprland.conf'
alias zshconf='${EDITOR_PROG} $ZDOTDIR/.zshrc'
alias waybarconf='${EDITOR_PROG} ~/.config/waybar/config.jsonc'
alias nvimconf='${EDITOR_PROG} ~/.config/nvim/init.lua'
alias tmuxconf='${EDITOR_PROG} ~/.config/tmux/tmux.conf'

alias szc='source $ZDOTDIR/.zshrc && clear'

# PS1='%F{white}%~ %(?.%F{green}.%F{red})%#%f ${vcs_info_msg_0_}'

source $ZDOTDIR/prompt.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/nvm/init-nvm.sh
