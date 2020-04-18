#!/bin/bash
SHELL_CONFIGS=(".inputrc")
SHELL_CONFIGS+=(".bash_aliases")
TMUX_CONFIG=".tmux.conf"
GIT_CONFIG=".gitconfig"
VIM_CONFIG=".vimrc"
COC_CONFIG=".vim/coc-settings.json"

echo 'OSTYPE is' "$OSTYPE"

if [[ "$OSTYPE" == "linux"* ]]; then
    # Linux
    SHELL_CONFIGS+=(".bashrc")

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    SHELL_CONFIGS+=(".bash_profile")

else
    # Unknown OS
    echo  "$OSTYPE" 'not supported'
    echo "dotfiles were not installed"
    exit 1
fi

# overwrite shell configuration files
for f in ${SHELL_CONFIGS[@]} $TMUX_CONFIG $GIT_CONFIG $VIM_CONFIG;
do
    # check if file exists and do a compare if it does
    if [[ -f "$f" ]]; then
        cmp --silent ./"$f" ~/"$f"
        exit_status=$?
        if [[ $exit_status -eq 1 ]]; then
           echo "$f" has updates
           echo -n "would you like to see the diff? (y/n [n]) "
           read -r ans
           if [[ ans -eq 'y' ]]; then
               git diff ~/"$f" ./"$f"
           fi
            cp -v -i ./"$f" ~/
        fi
    else
        cp -v ./"$f" ~/
    fi

done

# check if file exists and do a compare if it does
if [[ -f "$f" ]]; then
    cmp --silent ./"$COC_CONFIG" ~/"$COC_CONFIG"
    exit_status=$?
    if [[ $exit_status -eq 1 ]]; then
       echo $f has updates
       echo -n "would you like to see the diff? (y/n [n]) "
       read -r ans
       if [[ ans -eq 'y' ]]; then
           git diff ~/"$COC_CONFIG" ./"$COC_CONFIG"
       fi
       cp -v -i ./"$COC_CONFIG" ~/"$COC_CONFIG"
    fi
else
    #[[ -d "~/.vim"]] || mkdir ~/.vim
    cp -v ./"$COC_CONFIG" ~/"$COC_CONFIG"
fi

echo 'Installing Vim Plugins...'

vim -E -c PlugClean -c qa
vim -E -c PlugInstall -c qa

echo 'Done!'
echo 'Close and restart shell or source config files for changes to take effect'
