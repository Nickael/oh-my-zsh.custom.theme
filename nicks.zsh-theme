# prompt style and colors based on Steve Losh's Prose theme:
# https://github.com/sjl/oh-my-zsh/blob/master/themes/prose.zsh-theme
#
# vcs_info modifications from Bart Trojanowski's zsh prompt:
# http://www.jukie.net/bart/blog/pimping-out-zsh-prompt
#
# git untracked files modification from Brian Carper:
# https://briancarper.net/blog/570/git-info-in-your-zsh-prompt

export VIRTUAL_ENV_DISABLE_PROMPT=1

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('%F{blue}`basename $VIRTUAL_ENV`%f') '
}
PR_GIT_UPDATE=1

setopt prompt_subst

autoload -U add-zsh-hook
autoload -Uz vcs_info

local green="%{$fg[green]%}"
local red="%{$fg[red]%}"
local cyan="%{$fg[cyan]%}"
local yellow="%{$fg[yellow]%}"
local blue="%{$fg[blue]%}"
local magenta="%{$fg[magenta]%}"
local white="%{$fg[white]%}"
local reset="%{$reset_color%}"

#use extended color palette if available
if [[ $terminfo[colors] -ge 256 ]]; then
    turquoise="%F{81}"
    orange="%F{166}"
    purple="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
else
    turquoise="%F{cyan}"
    orange="%F{yellow}"
    purple="%F{magenta}"
    hotpink="%F{red}"
    limegreen="%F{green}"
fi

# enable VCS systems you use
zstyle ':vcs_info:*' enable git svn

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' check-for-changes true

# set formats
# %b - branchname
# %u - unstagedstr (see below)
# %c - stagedstr (see below)
# %a - action (e.g. rebase-i)
# %R - repository path
# %S - path in the repository
PR_RST="%f"
FMT_BRANCH="(%{$turquoise%}%b%u%c${PR_RST})"
FMT_ACTION="(%{$limegreen%}%a${PR_RST})"
FMT_UNSTAGED="%{$orange%} ● "
FMT_STAGED="%{$green%} ● "

zstyle ':vcs_info:*:prompt:*' unstagedstr   "${FMT_UNSTAGED}"
zstyle ':vcs_info:*:prompt:*' stagedstr     "${FMT_STAGED}"
zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION}"
zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""


function nicks_preexec {
    case "$2" in
        *git*)
            PR_GIT_UPDATE=1
            ;;
        *hub*)
            PR_GIT_UPDATE=1
            ;;
        *svn*)
            PR_GIT_UPDATE=1
            ;;
    esac
}
add-zsh-hook preexec nicks_preexec

function nicks_chpwd {
    PR_GIT_UPDATE=1
}
add-zsh-hook chpwd nicks_chpwd

function nicks_precmd {
    if [[ -n "$PR_GIT_UPDATE" ]] ; then
        # check for untracked files or updated submodules, since vcs_info doesn't
        if git ls-files --other --exclude-standard 2> /dev/null | grep -q "."; then
            PR_GIT_UPDATE=1
            FMT_BRANCH="%{$turquoise%}%b%u%c%{$hotpink%} ● ${PR_RST}"
        else
            FMT_BRANCH="%{$turquoise%}%b%u%c${PR_RST}"
        fi
        zstyle ':vcs_info:*:prompt:*' formats "${FMT_BRANCH} "

        vcs_info 'prompt'
        PR_GIT_UPDATE=
    fi
}
add-zsh-hook precmd nicks_precmd

function get_ip () {
  IFACE=$(ip -4 route | grep default | head -n1 | awk '{print $5}')
  if [ ! -z $IFACE ]; then
    echo -n ""; ip -4 -o addr show scope global $IFACE | awk '{gsub(/\/.*/, "",$4); print $4}' | paste -s -d ""
  else
    echo -n ""
  fi
}

PROMPT=$'
$vcs_info_msg_0_%{$purple%}%n${PR_RST} %{$green%}%~${PR_RST}
%(?.%(!.$red.$green).$yellow)%(!.#.$) '
RPROMPT='$(virtualenv_info)'
