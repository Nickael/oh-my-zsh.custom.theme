main() {
  # Use colors, but only if connected to a terminal, and that terminal
  # supports them.
  if which tput >/dev/null 2>&1; then
      ncolors=$(tput colors)
  fi
  if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
  else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
  fi

  # Only enable exit-on-error after the non-critical colorization stuff,
  # which may fail on systems lacking tput or terminfo
  set -e

  if [ ! -n "$ZSH" ]; then
    printf "${YELLOW}Please install oh-my-zsh first.${NORMAL}\n"
    ZSH=~/.oh-my-zsh
  fi

  if [ ! -n "$ZSH_NICKS_THEME" ]; then
    printf "${YELLOW}Please install zsh-theme first first.${NORMAL}\n"
    ZSH_CUSTOM=$ZSH/custom
    ZSH_NICKS_THEME=$ZSH_CUSTOM/themes/zsh-nicks-theme
  fi
  if [ ! -d "$ZSH" ]; then
    printf "${YELLOW}Please install oh-my-zsh first.${NORMAL}\n"
    exit
  fi

  # Prevent the cloned repository from having insecure permissions. Failing to do
  # so causes compinit() calls to fail with "command not found: compdef" errors
  # for users with insecure umasks (e.g., "002", allowing group writability). Note
  # that this will be ignored under Cygwin by default, as Windows ACLs take
  # precedence over umasks except for filesystems mounted with option "noacl".
  umask g-w,o-w

  printf "${BLUE}Cloning Nicks Theme...${NORMAL}\n"
  command -v git >/dev/null 2>&1 || {
    echo "Error: git is not installed"
    exit 1
  }
  # The Windows (MSYS) Git is not compatible with normal use on cygwin
  if [ "$OSTYPE" = cygwin ]; then
    if git --version | grep msysgit > /dev/null; then
      echo "Error: Windows/MSYS Git is not supported on Cygwin"
      echo "Error: Make sure the Cygwin git package is installed and is first on the path"
      exit 1
    fi
  fi
  env git clone --depth=1 https://github.com/Nickael/oh-my-zsh.custom.theme.git "$ZSH_NICKS_THEME" || {
    printf "Error: git clone of nicks theme repo failed\n"
    exit 1
  }
  env git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" || {
    printf "Error: git clone of zsh-syntax-highlighting plugin repo failed\n"
    exit 1
  }
  env git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" || {
    printf "Error: git clone of zsh-autosuggestions plugin repo failed\n"
    exit 1
  }

  env ln -s "$ZSH_NICKS_THEME/nicks.zsh-theme" "$ZSH_CUSTOM/themes/nicks.zsh-theme"

  printf "${BLUE}Looking for an existing zsh config...${NORMAL}\n"
  if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    printf "${YELLOW}Found ~/.zshrc.${NORMAL} ${GREEN}Backing up to ~/.zshrc.pre-oh-my-zsh${NORMAL}\n";
    mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
  fi

  cp "$ZSH_NICKS_THEME"/templates/zshrc.zsh-template ~/.zshrc

  sed "/^export ZSH_NICKS_THEME=/ c\\
  export ZSH_NICKS_THEME=\"$ZSH_NICKS_THEME\"
  " ~/.zshrc > ~/.zshrc-omztemp
  mv -f ~/.zshrc-omztemp ~/.zshrc

  printf "${BLUE}Looking for an existing${NORMAL} aliases.sh ${BLUE}...${NORMAL}\n"
  if [ -f ~/.aliases.sh ] || [ -h ~/.aliases.sh ]; then
    printf "${YELLOW}Found ~/.zshrc.${NORMAL} ${GREEN}Backing up to ~/.zshrc.pre-oh-my-zsh${NORMAL}\n";
    mv ~/.aliases.sh ~/.aliases.sh.pre-oh-my-zsh;
  fi
  cp "$ZSH_NICKS_THEME"/templates/aliases.sh ~/.aliases.sh

  env git config --global alias.br branch && git config --global alias.co checkout && git config --global alias.ci commit && git config --global alias.st status

  printf "${GREEN}"
  echo "Theme installed"
  printf "${NORMAL}"
  env zsh -l
}

sh "$ZSH_NICKS_THEME"/tools/insall.oh.my.zsh.sh
main
