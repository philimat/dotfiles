#!/bin/bash
# My first script
echo 'copying dotfiles to ~'
cp ./{.gitconfig,.vimrc,.inputrc,.bashrc,.tmux.conf} ~/
echo 'moving coc-settings to .vim directory for coc.nvim extension'
cp ./coc-settings.json ~/.vim
echo 'sourcing .inputrc, .bashrc and .tmux.conf'
source ~/{.inputrc,.bashrc,.tmux.conf}
echo 'Done!'
