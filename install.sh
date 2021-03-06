#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
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
    bash $SCRIPT_DIR/"Xcode/install.sh"
    #VIM_CONFIGS+=(".xvimrc")

else
    # Unknown OS
    echo  "$OSTYPE" 'is not supported. dotfiles were not installed'
    exit 1
fi

# remove home directory config files and link to dotfiles repo
for f in ${SHELL_CONFIGS[@]} ${VIM_CONFIGS[@]} $TMUX_CONFIG $GIT_CONFIG $CONDA_CONFIG;
do
    ln -sfiv $SCRIPT_DIR/"$f" ~/"$f"
done

# remove coc-settings and link to dotfiles repo
ln -sfiv $SCRIPT_DIR/"$COC_CONFIG" ~/"$COC_CONFIG"

echo 'Installing Vim Plugins...'

vim -E -c PlugClean -c qa
vim -E -c PlugInstall -c qa

echo 'Done! Close and restart shell for changes to take effect'
