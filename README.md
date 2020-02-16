# oh-my-zsh.custom.theme

This is a custom theme for oh-my-zsh

You can use this theme with oh-my-zsh.

## Prerequisites

* [zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
* [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* curl or wget
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

## Manual installation

First install **curl**, **git**, **zsh**, then follow the steps below :

1. Clone and install **oh-my-zsh** :

    Via *curl* :

    ```shell

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    ```

    Via *wget*:

    ```shell

    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

    ```

2. Clone and install some useful plugins :

    ZSH syntax highlighting :

    ```shell
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    ```

    ZSH autosuggestions :

    ```shell

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    ```

3. Clone this projet in your zsh custhom theme :

    ```shell

    git clone https://github.com/Nickael/oh-my-zsh.custom.theme.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/nicks

    ```

4. Enable the plugin in your zshrc :

    ```shell

    plugins=(zsh-autosuggestions zsh-syntax-highlighting)

    ```

5. Enable the theme in your zshrc :

    ```shell

    ZSH_THEME=nicks

    ```

## Installing using curl or wget

Via *curl* :

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Nickael/oh-my-zsh.custom.theme/master/tools/install.sh)"
```

Via *wget*:

```shell
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sh -c "$(wget https://raw.githubusercontent.com/Nickael/oh-my-zsh.custom.theme/master/tools/install.sh -O -)"
```
