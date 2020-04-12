alias desktop='cd ~/Desktop'
alias onedrive='cd ~/OneDrive'

# ls aliases
alias la='ls -AF'
alias ll='ls -l'
alias l='ls -CF'

# safer file deleting and overwriting
alias mv="mv -i"
alias rm="rm -i"

# git aliases
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gcommit='git commit'
alias gpush='git push'
alias gpull='git pull'

# history aliases
alias h='history 5'                 # show last five lines
alias hi='history 10'               # show last ten lines
alias his='history 20'              # show last 20 lines
alias hist='history 40 | less'      # show last 40; pipe to 'less'
alias histo='history 70 | less'     # show last 70; pipe to 'less'
alias histor='history 100 | less'   # show last 100; pipe to 'less'

# check current external ip address
alias checkip="curl -s checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"

# transmission-remote aliases
alias tsm='transmission-remote'
alias t-list='transmission-remote -n 'transmission:transmission' -l'
alias t-basicstats='transmission-remote -n 'transmission:transmission' -st'
alias t-fullstats='transmission-remote -n 'transmission:transmission' -si'
alias t-killall='transmission-remote -t all -r'
alias t-watch='watch -n1 -x transmission-remote -tall -l'

# Linux specific aliases
if [[ "$OSTYPE" == "linux"* ]]; then
	# transmission-daemon aliases
    alias t-start='sudo service transmission-daemon start'
    alias t-stop='sudo service transmission-daemon stop'
    alias t-reload='sudo service transmission-daemon reload'
    # vpn aliases
    alias pia-start='sudo systemctl start openvpn@pia.service'
    alias pia-stop='sudo systemctl stop openvpn@pia.service'
    alias pia-restart='sudo systemctl restart openvpn@pia.service'

# Mac OSX specific aliases
elif [[ "$OSTYPE" == "darwin"* ]]; then
	# transmission-cli aliases
	alias t-start='brew services start transmission-cli'
	alias t-stop='brew services stop transmission-cli'
	alias t-reload='brew services restart transmission-cli'
	# vpn aliases
	alias pia-start='piactl connect'
	alias pia-stop='piactl disconnect'
	alias pia-status='piactl get connectionstate'
	alias pia-region='piactl get region'
fi
