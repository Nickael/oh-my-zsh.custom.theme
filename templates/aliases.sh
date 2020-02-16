alias l="ls"
alias ll="ls -l"
alias la="ls -la"
alias a="ls -a"

alias cp="cp -v"
alias mv="mv -v"
alias mkdir="mkdir -v"
alias rm="rm -v"
alias ln="ln -v"

alias z="vi ~/.zshrc"
alias b="vi ~/.bashrc"
alias h="vi ~/.zsh_history"
alias sz="source ~/.zshrc"
alias va="vi ~/.aliases.sh"

if hash vim 2> /dev/null; then
    alias vi="vim"
fi

if hash docker 2> /dev/null; then
    alias d="docker"
fi
if hash docker-compose 2> /dev/null; then
    alias dk="docker-compose"
fi

if hash apt 2>/dev/null; then
    alias i="sudo apt update && sudo apt install -y"
    alias r="sudo apt autoremove --purge"
    alias s="sudo apt-cache search"
    alias u="sudo apt update && sudo apt upgrade"
else
    alias i="sudo yum update && sudo yum install -y"
    alias r="sudo yum autoremove"
    alias s="sudo yum search"
    alias u="sudo yum update && sudo yum upgrade"
fi

alias q="exit"

