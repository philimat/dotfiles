# Some good standards, which are not used if the user
# creates his/her own .bashrc/.bash_profile

# --show-control-chars: help showing Korean or accented characters
alias ls='ls -F --color=auto --show-control-chars'

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

case "$TERM" in
xterm*)
	# The following programs are known to require a Win32 Console
	# for interactive usage, therefore let's launch them through winpty
	# when run inside `mintty`.
	for name in node ipython php php5 psql python2.7
	do
		case "$(type -p "$name".exe 2>/dev/null)" in
		''|/usr/bin/*) continue;;
		esac
		alias $name="winpty $name.exe"
	done
	;;
esac
