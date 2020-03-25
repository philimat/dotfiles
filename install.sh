#!/bin/bash
SHELL_CONFIGS=(".inputrc"
)
TMUX_CONFIG=".tmux.conf"
GIT_CONFIG=".gitconfig"
VIM_CONFIG=".vimrc"
COC_CONFIG=".vim/coc-settings.json"

echo 'OSTYPE is' $OSTYPE

if [[ "$OSTYPE" == "linux"* ]]; then
    # Linux
    SHELL_CONFIGS+=(".bashrc")

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    SHELL_CONFIGS+=(".bash_profile")

else
    # Unknown OS
    echo  $OSTYPE 'not supported'
    echo "dotfiles were not installed"
    exit 1
fi

# overwrite shell configuration files
for f in ${SHELL_CONFIGS[@]} $TMUX_CONFIG $GIT_CONFIG $VIM_CONFIG;
do
    cmp --silent ./$f ~/$f
    exit_status=$?

    if [[ $exit_status -eq 1 ]]; then
       echo $f has updates
       echo -n "would you like to see the diff? (y/n [n]) "
       read -r ans
       if [[ ans -eq 'y' ]]; then
           git diff ~/$f ./$f
       fi
       cp -v -i ./$f ~/
    fi

done

cmp --silent ./$COC_CONFIG ~/$COC_CONFIG
exit_status=$?
if [[ $exit_status -eq 1 ]]; then
   echo $f has updates
   echo -n "would you like to see the diff? (y/n [n]) "
   read -r ans
   if [[ ans -eq 'y' ]]; then
       git diff ~/$COC_CONFIG ./$COC_CONFIG
   fi
   cp -v -i ./$COC_CONFIG ~/$COC_CONFIG
fi

# load shell configuration into current shell
for f in ${SHELL_CONFIGS[@]};
do
    echo 'sourcing' $f
    sleep .5
    source ~/$f
done

# load tmux conf into current shell
echo 'sourcing' $TMUX_CONFIG
tmux source ~/$TMUX_CONFIG

echo 'Installing Vim Plugins...'

vim -E -c PlugClean -c qa
vim -E -c PlugInstall -c qa

echo 'Done!'
