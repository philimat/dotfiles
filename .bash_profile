# Silence MacOS Catalina Bash Warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# Bash functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Terminal Color Settings
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\e[35m\]\$(parse_git_branch)\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Use vim
export EDITOR=vim
export VISUAL=vim

# Check whether shell is interactive for colorscheme
case $- in
    *i*) source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh" ;;
esac

# Directory for personal scripts and programs
export PATH="$PATH:$HOME/bin"

# Use Vim for enhanced reading of man pages
export PATH="$PATH:$HOME/.vim/plugged/vim-superman/bin"
complete -o default -o nospace -F _man vman

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Homebrew
export PATH=/usr/local/bin:$PATH

# Local bash settings
if [ -f ~/.bash_profile.local ]; then
    . ~/.bash_profile.local
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

