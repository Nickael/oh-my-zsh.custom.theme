#!/bin/sh

# region conditional aliases
if hash vim 2> /dev/null; then
    alias vi="vim"
fi

if hash docker 2> /dev/null; then
    alias d="docker"
fi
if hash docker-compose 2> /dev/null; then
    alias dk="docker-compose"
fi

if hash code-insiders 2> /dev/null; then
    alias code="code-insiders"
fi

if hash apt 2>/dev/null; then
    alias i="sudo apt update && sudo apt install -y"
    alias r="sudo apt autoremove --purge"
    alias s="sudo apt-cache search"
    alias u="sudo apt update && sudo apt upgrade"
elif hash yum 2>/dev/null; then
    alias i="sudo yum update && sudo yum install -y"
    alias r="sudo yum autoremove"
    alias s="sudo yum search"
    alias u="sudo yum update && sudo yum upgrade"
fi

if hash code-insiders 2> /dev/null; then
    alias code="code-insiders"
#    alias c="code"
fi

if hash synaptic 2> /dev/null; then
    alias si="sudo synaptic"
fi

if hash curljson 2> /dev/null;
then
    alias curl="curljson -i"
else
    pip install curljson
    alias curl="curljson -i"
fi

if hash ng 2> /dev/null; then
    alias nhs="g serve --host 0.0.0.0 --port 8080 --disable-host-check"
    #    alias ns="ng serve --ssl --ssl-key .certs/localhost.key --ssl-cert .certs/localhost.crt"
    alias ns="ng serve --host 0.0.0.0 --disable-host-check"
fi

alias c="ccze -A"

alias docker_prune="docker system prune -a"
alias journal_clean="journalctl --vacuum-time=10d"

if hash vagrant 2> /dev/null; then
    alias v="vagrant"
    alias vgs="vagrant ssh"
    alias vdu="vagrant destroy --force && vagrant up --provision"
    alias vu="vagrant up --provision"
    alias vd="v destroy --force"
fi

if hash exa 2> /dev/null; then
    alias ls="exa -h --icons -l"
    alias t='exa -T -I "node_modules|venv|.git|.angular|.idea|.yarn|.vscode" --icons'
fi
# endregion

alias l="ls -l"
alias ll="l"
alias lt="ls --tree"
alias la="ls -la"
alias tree="lt"

alias cp="cp -v"
alias mv="mv -v"
alias mkdir="mkdir -v"
alias rm="rm -v"
alias ln="ln -v"

alias h="vi ~/.zsh_history"
alias vz="vi ~/.zshrc"
alias vb="vi ~/.bashrc"
alias va="vi ~/.aliases.sh"
alias vs="vi $HOME/.fn.sh $HOME/.aliases.sh $HOME/.zshrc"
alias sz="source ~/.zshrc"
alias vimrc="vi ~/.vimrc"
alias di="sudo dpkg -i"
alias ns="ng s"
alias vn="vi ~/.npmrc"
alias yi="yarn install"
alias ya="yarn add"
alias yo="yarn outdated"
alias y="yarn"

alias n="npm"
alias ni="npm i"
alias no="n outdated"

alias q="exit"

alias po="sudo poweroff"
alias re="sudo reboot"

