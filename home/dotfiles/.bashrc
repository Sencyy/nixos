#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Color scheme
# (cat ~/.cache/wal/sequences &)

# General aliases
alias grep='grep --color=auto'
alias nano='nano -i'
alias stow='stow -t ~/'
alias ls='eza -l --icons --git'
alias ll='eza -la --icons --git'
alias ip='ip -c'
alias cat='bat'
alias grep='rg'
alias sxiv='nsxiv'
alias mcr='micro'
alias tmpsh='podman run --volume $(pwd):/directory --rm -it'
alias qr='qrencode -t UTF8'

# Directory management alaiases
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias mkdir='mkdir -pv'
alias rmdir='rmdir -v'


# Game aliases
alias msc='gamemoderun wine ~/games/My\ Summer\ Car/mysummercar.exe'

export EDITOR=vim

PATH="$PATH:/home/hanako/.local/bin:/home/hanako/.venv/bin:~/.config/emacs/bin"
PS1='[\u@\h \W]\$ '

# Cowsay fortune lolcat
# fortune | cowsay | lolcat
