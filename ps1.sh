# Git status

check_status() {

red="$bold$(tput setaf 1)"
green=$(tput setaf 2)

boshka= git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' > /dev/null 2>&1

# assets 𝘟 ✗ Ӽ 𝘟 𝞦 ✔ ✓ ▲ ➜
# Checks if something to commit or not
if git rev-parse --git-dir > /dev/null 2>&1; then
    if ! git status | grep "nothing to commit" > /dev/null 2>&1; then
      echo "${red} [x]"
      return 0
    elif $boshka; then
        echo "${green} [✔]"
    fi
fi

}

branch_emoji(){
    echo "|⤴︎"
}

# Git branch

check_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# PS1 is similar to html tags but with color the tag starts like:
# \[\e[0;32m] bla bla \[\e[0m\] 0;32 is color green, space is \[$(tput sgr0)\], \W current dir

export PS1="\[\e[0;32m\]➜ \[\e[0m\]\[\$(check_status)\]"
       PS1+="\[$(tput sgr0)\]\[\e[1;34m\]\W\[\e[0m\]"
       PS1+="\[\e[0;36m\]\$(branch_emoji)\$(check_branch)\[\e[0m\]\n    \[$(tput sgr0)\]"
       PS1+="\[\e[0;33m\]  ▲ =\[\e[0m\]\[$(tput sgr0)\]\[\e[1;37m\] "

export CLICOLOR=1
export LSCOLORS=fxfxBxDxgxegedabagacad
