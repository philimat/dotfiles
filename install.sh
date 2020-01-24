#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux
    echo 'Linux detected'
    echo 'copying dotfiles to ~'
    cp ./{.gitconfig,.vimrc,.inputrc,.bashrc,.tmux.conf} ~/
    echo 'moving coc-settings to .vim directory for coc.nvim extension'
    cp ./coc-settings.json ~/.vim
    echo 'sourcing .inputrc, .bashrc and .tmux.conf'
    source ~/{.inputrc,.bashrc,.tmux.conf}
    echo 'Done!'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    echo 'Mac OS detected'
    echo 'copying dotfiles to ~'
    cp ./{.gitconfig,.vimrc,.inputrc,.bashrc,.bash_profile,.tmux.conf} ~/
    echo 'moving coc-settings to .vim directory for coc.nvim extension'
    cp ./coc-settings.json ~/.vim
    echo 'sourcing .inputrc, .bash_profile and .tmux.conf'
    source ~/{.inputrc,.bash_profile,.tmux.conf}
    echo 'Done!'

else
    # Unknown OS
    echo "The operating system could not be detected. Config not installed."
fi
