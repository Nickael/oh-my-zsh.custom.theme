# oh-my-zsh.custom.theme

This is a custom theme for oh-my-zsh

You can use this theme with oh-my-zsh.

## Prerequisites

* [zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
* [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* curl or wget
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

## Installation

First install **curl**, **git**, **zsh**, then follow the steps below :

1. Clone and install **oh-my-zsh** :

    Via *curl* :
    ```
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```

    Via *wget*:
    ```
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    ```
2. Clone and install some useful plugins :

    ZSH syntax highlighting :
    ```
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```
    ZSH autosuggestions :
    ```
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```
3. Clone this projet in your zsh custhom theme :
    ```
    git clone https://github.com/Nickael/oh-my-zsh.custom.theme.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/nicks
    ```
4. Enable the plugin in your zshrc :
    ```
    plugins=(zsh-autosuggestions zsh-syntax-highlighting)
    ```
5. Enable the theme in your zshrc :
    ```
    ZSH_THEME=nicks
    ```

## Installing using curl or wget


Via *curl* :

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Nickael/oh-my-zsh.custom.theme/master/tools/install.sh)"

Via *wget*:

    sh -c "$(wget https://raw.githubusercontent.com/Nickael/oh-my-zsh.custom.theme/master/tools/install.sh -O -)"