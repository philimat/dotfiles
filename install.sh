#!/bin/bash
SHELL_CONFIGS=(".inputrc")
SHELL_CONFIGS+=(".bash_aliases")
SHELL_CONFIGS+=(".bash_functions")
TMUX_CONFIG=".tmux.conf"
GIT_CONFIG=".gitconfig"
VIM_CONFIGS=(".vimrc")
CONDA_CONFIGS=(".condarc")
COC_CONFIG=".vim/coc-settings.json"

echo 'OSTYPE is' "$OSTYPE"

if [[ "$OSTYPE" == "linux"* ]]; then
    # Linux
    SHELL_CONFIGS+=(".bashrc")

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    SHELL_CONFIGS+=(".bash_profile")
    VIM_CONFIGS+=(".xvimrc")

else
    # Unknown OS
    echo  "$OSTYPE" 'not supported'
    echo "dotfiles were not installed"
    exit 1
fi

# remove home directory config files and link to dotfiles repo
for f in ${SHELL_CONFIGS[@]} ${VIM_CONFIGS[@]} $TMUX_CONFIG $GIT_CONFIG $CONDA_CONFIG;
do
    if [[ -e ~/"$f" ]] || [[ -L ~/"$f" ]]; then
        rm -v -i ~/"$f"
    fi
    ln -s $(pwd)/"$f" ~/"$f"
done

# remove existing coc-settings and link to dotfiles repo
if [[ -e ~/"$COC_CONFIG" ]] || [[ -L ~/"$COC_CONFIG" ]] ; then
    rm -v -i ~/"$COC_CONFIG"
fi

ln -s $(pwd)/"$COC_CONFIG" ~/"$COC_CONFIG"

echo 'Installing Vim Plugins...'

vim -E -c PlugClean -c qa
vim -E -c PlugInstall -c qa

echo 'Done!'
echo 'Close and restart shell for changes to take effect'
