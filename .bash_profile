# Source .bashrc
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Terminal Color Settings
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

# Homebrew
export PATH=/usr/local/bin:$PATH

# MacPorts Installer addition on 2019-04-04_at_06:52:05: adding an appropriate PATH variable for use with MacPorts.
 export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

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

