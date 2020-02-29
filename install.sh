#!/bin/bash
if [[ "$OSTYPE" == "linux"* ]]; then
    # Linux
    echo 'Linux detected'
    #echo 'copying dotfiles to ~'
    cp -v -i ./{.gitconfig,.vimrc,.inputrc,.bashrc,.tmux.conf} ~/
    #echo 'moving coc-settings to .vim directory for coc.nvim extension'
    cp -v -i ./coc-settings.json ~/.vim
    echo 'sourcing .inputrc, .bashrc and .tmux.conf'
    source ~/{.inputrc,.bashrc,.tmux.conf}
    echo 'Installing Vim Plugins...'
    vim -E -c PlugClean -c qa
    vim -E -c PlugInstall -c qa
    echo 'Done!'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    echo 'Mac OS detected'
    cp -v -i ./{.gitconfig,.vimrc,.inputrc,.bash_profile,.tmux.conf} ~/
    echo 'moving coc-settings to .vim directory for coc.nvim extension'
    cp -v -i ./coc-settings.json ~/.vim
    echo 'sourcing .inputrc, .bash_profile and .tmux.conf'
    source ~/{.inputrc,.bash_profile,.tmux.conf}
    echo 'Installing Vim Plugins...'
    vim -E -c PlugClean -c qa
    vim -E -c PlugInstall -c qa
    echo 'Done!'

else
    # Unknown OS
    echo "The operating system could not be detected. Config not installed."
fi
