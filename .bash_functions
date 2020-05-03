# Git branch of current directory
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Easy grepping of help outputs
help_grep(){
eval "$1 -h" 2>&1 | grep "$2"
}

