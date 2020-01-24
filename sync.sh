#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux
    echo 'Linux detected'
    rsync ~/{.gitconfig,.vimrc,.inputrc,.bashrc,.tmux.conf} ./
    rsync ~/.vim/coc-settings.json ./
    echo 'Synced!'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    echo 'Mac OS detected'
    rsync ~/{.gitconfig,.vimrc,.inputrc,.bash_profile,.tmux.conf} ./
    rsync ~/.vim/coc-settings.json ./
    echo 'Synced!'

else
    # Unknown OS
    echo "The operating system could not be detected. Config files not synced."
fi
