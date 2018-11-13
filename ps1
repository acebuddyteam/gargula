
# Git branch:

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


# PS1 is similar to html tags but with color the tag starts like:
# \[\e[0;32m] bla bla \[\e[0m\] 0;32 is color green, space is \[$(tput sgr0)\], \W current dir

export PS1="\[\e[0;32m\]➜  \[\e[0m\]\[$(tput sgr0)\]\[\e[1;34m\]\W\[\e[0m\]\[\e[0;33m\]\$(parse_git_branch): \[\e[0m\]\n   \[$(tput sgr0)\]\[\e[0;36m\]\#:\[\e[0m\]\[$(tput sgr0)\]\[\e[1;37m\]"

# More color for your terminal:

export CLICOLOR=1
export LSCOLORS=fxfxBxDxgxegedabagacad
alias ls='ls -GFh'

