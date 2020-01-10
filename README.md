# dotfiles
My configuration files: Vim, Bash, tmux, and some VS Code stuff

## macOS 
- To enable key repeats in VS Code for Vim extension, type these commands into Terminal:    
```
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false 
defaults delete -g ApplePressAndHoldEnabled  # If necessary, reset global default     
```
- Remap <kbd>caps lock</kbd>&rightarrow;<kbd>esc</kbd> & <kbd>esc</kbd>&rightarrow;<kbd>caps lock</kbd>  
  1. Install [Karabiner Elements ](https://pqrs.org/osx/karabiner/)
  2. Create the simple modifications shown below:  
![](images/karabiner.png) 

## Ubuntu
- Remap <kbd>caps lock</kbd>&rightarrow;<kbd>esc</kbd> & <kbd>esc</kbd>&rightarrow;<kbd>caps lock</kbd>  
  1. Install **Gnome Tweak Tool**:  
    `sudo apt-get install gnome-tweak-tool`
  2. Keyboard & Mouse &rightarrow; Additional Layouts Options &rightarrow; Caps Lock Behavior &rightarrow; Swap ESC & Caps Lock

## Windows
- Remap <kbd>caps lock</kbd>&rightarrow;<kbd>esc</kbd> & <kbd>esc</kbd>&rightarrow;<kbd>caps lock</kbd>  
  1. Install [Windwos Server 2003 Resource Kit](https://www.microsoft.com/en-us/download/details.aspx?id=17657) 
  2. Navigate to *C:\Program Files (x86)\Windows Resource Kits\Tools*
  3. Run as Administrator *remapkey.exe*
  4. Change keys as shown below:
![](images/remapkey.png)
  5. Save and Exit
  6. Reboot 


[w]:images/windows_icon.png
[l]:images/linux_icon.png
[m]:images/macOS_icon.png