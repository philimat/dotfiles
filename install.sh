#!/bin/bash
# My first script

cp ./{.gitconfig,.vimrc,.inputrc,.bashrc,.tmux.conf} ~/
cp ./coc-settings.json ~/.vim
source ~/{.inputrc,.bashrc,.tmux.conf}
