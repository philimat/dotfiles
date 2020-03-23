#!/bin/bash
if [[ "$OSTYPE" == "linux"* ]]; then
    # Linux
    rsync -v ~/{.gitconfig,.vimrc,.inputrc,.bashrc,.tmux.conf} ./
    rsync -v ~/.vim/coc-settings.json ./.vim

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    rsync -v ~/{.gitconfig,.vimrc,.inputrc,.bash_profile,.tmux.conf} ./
    rsync -v ~/.vim/coc-settings.json ./.vim
else
    # Unknown OS
    echo $OSTYPE "not supported"
    echo "Config files not synced."
    exit 1
fi
