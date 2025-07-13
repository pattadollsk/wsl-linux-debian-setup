# Set path if required
#export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias ec="$EDITOR $HOME/.zshrc" # edit .zshrc
alias sc="source $HOME/.zshrc"  # reload zsh configuration

# Set up the prompt - if you load Theme with zplugin as in this example, this will be overriden by the Theme. If you comment out the Theme in zplugins, this will be loaded.
autoload -Uz promptinit
promptinit
prompt adam1            # see Zsh Prompt Theme below

# Use vi keybindings even if our EDITOR is set to vi
bindkey -e

# ZLE (Zsh Line Editor) key bindings for Ctrl+Arrow word movement
# These match the standard Xterm-style sequences when confirmed with cat -v

# Ctrl+Right Arrow (forward-word)
bindkey '^[[1;5C' forward-word

# Ctrl+Left Arrow (backward-word)
bindkey '^[[1;5D' backward-word

setopt histignorealldups sharehistory

# Keep 1000000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# zplug - manage plugins
source /usr/share/zplug/init.zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/pyenv", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
# zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf"
zplug "themes/robbyrussell", from:oh-my-zsh, as:theme   # Theme
# zplug "themes/wedisagree", from:oh-my-zsh, as:theme   # Theme
# ZSH_THEME=wedisagree
zstyle ':omz:alpha:lib:git' async-prompt no

# zplug - install/load new plugins when zsh is started or reloaded
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# zplug load --verbose
zplug load
# ZSH_THEME=wedisagree

# inside .zshrc file
plugins=( git zsh-syntax-highlighting )

RPROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} %D %* % %{$reset_color%}'

export HOMEBREW_NO_AUTO_UPDATE=TRUE
export HOMEBREW_NO_INSTALL_UPGRADE=TRUE
export HOMEBREW_NO_INSTALL_CLEANUP=TRUE

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PATH="/home/linuxbrew/.linuxbrew/opt/openjdk@8/bin:$PATH"

# For compilers to find openjdk@8 you may need to set:
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/openjdk@8/include"

