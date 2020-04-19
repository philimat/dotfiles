parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

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

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$($HOME'/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
