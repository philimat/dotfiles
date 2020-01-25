#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux
    echo 'Linux detected'
    echo 'Syncing files...'
    rsync -v ~/{.gitconfig,.vimrc,.inputrc,.bashrc,.tmux.conf} ./
    rsync -v ~/.vim/coc-settings.json ./

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    echo 'Mac OS detected'
    echo 'Syncing files...'
    rsync -v ~/{.gitconfig,.vimrc,.inputrc,.bash_profile,.tmux.conf} ./
    rsync -v ~/.vim/coc-settings.json ./

else
    # Unknown OS
    echo "The operating system could not be detected. Config files not synced."
fi
