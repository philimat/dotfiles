# dotfiles
My configuration files: Vim, Bash, tmux, and some VS Code stuff

## **macOS** 
- To enable key repeats in VS Code for Vim extension, type these commands into Terminal:    
```sh
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false 
defaults delete -g ApplePressAndHoldEnabled  # If necessary, reset global default     
```
- Remap <kbd>caps lock</kbd>&rightarrow;<kbd>esc</kbd> & <kbd>esc</kbd>&rightarrow;<kbd>caps lock</kbd>  
  1. Install [Karabiner Elements ](https://pqrs.org/osx/karabiner/)
  2. Create the simple modifications shown below:  
![](images/karabiner.png) 
- Install Vim
  ```sh
  brew install macvim
  ```  
- Install Node.js  
  -First, install Homebrew.  
  ```sh
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```  
  -Make sure Homebrew is up to date.  
  ```sh
  brew update
  ```  
  -Follow any brew doctor recommendations  
  ```sh
  brew doctor
  ```  
  -Add Homebrew's location to your `$PATH` in your `.bash_profile` or `.zshrc` file.  
  ```sh
  export PATH="/usr/local/bin:$PATH"
  ```  
  -Install Node.js  
  ```sh
  brew install node
  ```  
- Install Nerd Fonts for NERDTree to work with vim-devicons  
    ```sh
    brew tap homebrew/cask-fonts
    brew cask install font-hack-nerd-font
    ```  
    Terminal &rightarrow; Preferences &rightarrow; Profiles &rightarrow; \<Default profile\> &rightarrow; Text &rightarrow; Change ... &rightarrow; Family &rightarrow; Hack Nerd Font
- Install `tmux` and `tpm` plugin manager
    ```sh
    brew install tmux
    ``` 
    Follow [github](https://github.com/tmux-plugins/tpm) instructions for `tpm`  
    Install `tpm` plugins within `tmux` by pressing `prefix` + <kbd>I<kbd>  


## **Ubuntu**
- Remap <kbd>caps lock</kbd>&rightarrow;<kbd>esc</kbd> & <kbd>esc</kbd>&rightarrow;<kbd>caps lock</kbd>  
  1. Install **Gnome Tweak Tool**:  
    ```sh
    sudo apt-get install gnome-tweak-tool
    ```
  2. Keyboard & Mouse &rightarrow; Additional Layouts Options &rightarrow; Caps Lock Behavior &rightarrow; Swap ESC & Caps Lock
- Install Vim
  ```sh
  sudo apt-get install vim
  ```  
## **Windows**
- Remap <kbd>caps lock</kbd>&rightarrow;<kbd>esc</kbd> & <kbd>esc</kbd>&rightarrow;<kbd>caps lock</kbd>  
  1. Install [Windows Server 2003 Resource Kit](https://www.microsoft.com/en-us/download/details.aspx?id=17657) 
  2. Navigate to *C:\Program Files (x86)\Windows Resource Kits\Tools*
  3. Run as Administrator *remapkey.exe*
  4. Change keys as shown below:
![](images/remapkey.png)
  5. Save and Exit
  6. Reboot 


[w]:images/windows_icon.png
[l]:images/linux_icon.png
[m]:images/macOS_icon.png
