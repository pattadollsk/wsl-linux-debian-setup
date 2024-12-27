# WSL Linux Debian Setup
A guide to using Windows Subsystem for Linux (WSL) to setup Debian distribution GNU/Linux environment
## Motivation
Having  used macOS  which is based on the Unix operating system for my work, while using Windows as my personal laptop. I want to set up a working environment as close to the Unix operating system as possible. So I created a setup guide to the Linux environment by leveraging WSL.
# Getting Started
```zsh
sudo apt update && sudo apt upgrade
```

# Prerequisite for pyenv
- ref: https://stackoverflow.com/questions/67807596/pyenv-install-3-x-build-failed-ubuntu-20-04-using-python-build-20180424
```zsh
sudo apt install \
    build-essential \
    curl \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxmlsec1-dev \
    llvm \
    make \
    tk-dev \
    wget \
    xz-utils \
    zlib1g-dev
```

# Install Zsh
Install Zsh for Debian
- Ref: https://wiki.debian.org/Zsh

```bash
sudo apt install zsh zplug
```

## Start Configuration with zshrc
Use the .zshrc template from [.zshrc-template](/samples/zsh/)

# Install Oh My Zsh!
- Ref: https://github.com/ohmyzsh/ohmyzsh/wiki
```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
## Add timestamp to prompt
- Ref: https://superuser.com/questions/943844/add-timestamp-to-oh-my-zsh-robbyrussell-theme
```zsh
# inside .zshrc file paste the following line
RPROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} %D %* % %{$reset_color%}'
```

## Issue with zsh startup
- source: https://github.com/ohmyzsh/ohmyzsh/issues/12322
- https://github.com/ohmyzsh/ohmyzsh#disable-async-git-prompt

## zsh-syntax-highlighting
```zsh
# git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
- Activate plugins
```zsh
# inside .zshrc file
plugins=( git zsh-syntax-highlighting )
```

# Install Brew for linux

## Requirements
```zsh
sudo apt-get install build-essential procps curl file git
```

## Install Homebrew
```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
## Next steps:
- Run these two commands in your terminal to add Homebrew to your PATH:
    (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/pattadollsk/.zshrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
- Install Homebrew's dependencies if you have sudo access:
    sudo apt-get install build-essential
  For more information, see:
    https://docs.brew.sh/Homebrew-on-Linux
- We recommend that you install GCC:
    brew install gcc
- Run brew help to get started
- Further documentation:
    https://docs.brew.sh

## Useful HOMEBREW Setup
- Ref: https://docs.brew.sh/Manpage
- Unless HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK is set, brew upgrade or brew reinstall will be run for outdated dependents and dependents with broken linkage, respectively.

- Unless HOMEBREW_NO_INSTALL_CLEANUP is set, brew cleanup will then be run for the installed formulae or, every 30 days, for all formulae.

- Unless HOMEBREW_NO_INSTALL_UPGRADE is set, brew install formula will upgrade formula if it is already installed but outdated.

### Example
- Inside .zshrc file

```zsh
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=TRUE
```
```zsh
export HOMEBREW_NO_INSTALL_CLEANUP=TRUE
```
```zsh
export HOMEBREW_NO_AUTO_UPDATE=TRUE
```
```zsh
export HOMEBREW_NO_INSTALL_UPGRADE=TRUE
```

## Install Colima

### Docker and Docker-Compose

```zsh
brew install docker
```
```zsh
brew install docker-compose
```
```zsh
Compose is a Docker plugin. For Docker to find the plugin, add "cliPluginsExtraDirs" to ~/.docker/config.json:
  "cliPluginsExtraDirs": [
      "/home/linuxbrew/.linuxbrew/lib/docker/cli-plugins"
  ]
```

### Install Colima

```zsh
brew install colima
```

### Troubleshooting with Colima

```
> "[hostagent] failed to exit SSH master" error="failed to execute `ssh -O exit -p 36245 127.0.0.1`, out=\"Control socket connect(/home/pattadol/.config/colima/_lima/colima/ssh.sock): No such file or directory\\r\\n\": exit status 255"
> [hostagent] Shutting down QEMU with ACPI
> [hostagent] Failed to remove SSH binding for port 36245
> "[hostagent] failed to open the QMP socket \"/home/pattadol/.config/colima/_lima/colima/qmp.sock\", forcibly killing QEMU" error="dial unix /home/pattadol/.config/colima/_lima/colima/qmp.sock: connect: connection refused"
> [hostagent] QEMU has already exited
> exiting, status={Running:false Degraded:false Exiting:true Errors:[] SSHLocalPort:0} (hint: see "/home/pattadol/.config/colima/_lima/colima/ha.stderr.log")
```

Try running command:
```zsh
sudo chmod 666 /dev/kvm
```
- Ref: https://github.com/sickcodes/Docker-OSX/issues/55

## Pyenv

### Useful Links to Official Pyenv github Docs
- https://github.com/pyenv/pyenv/wiki#suggested-build-environment

```zsh
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
```

### Pyenv Known Issues

- Ref: https://stackoverflow.com/questions/5459444/tkinter-python-may-not-be-configured-for-tk
```zsh
Traceback (most recent call last):
  File "<string>", line 1, in <module>
  File "/home/pattadol/.pyenv/versions/3.11.11/lib/python3.11/tkinter/__init__.py", line 38, in <module>
    import _tkinter # If this fails your Python may not be configured for Tk
    ^^^^^^^^^^^^^^^
ModuleNotFoundError: No module named '_tkinter'
WARNING: The Python tkinter extension was not compiled and GUI subsystem has been detected. Missing the Tk toolkit?
```
Solution
```zsh
# brew install python-tk@<python-version>
brew install python-tk@3.11
```
