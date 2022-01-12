### ohmyzsh
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto    # update automatically without asking
zstyle ':omz:update' frequency 13 # in days

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
plugins=(gh git vi-mode docker gcloud kubectl helm)

source $ZSH/oh-my-zsh.sh

bindkey "jk" vi-cmd-mode        # keyboard bindings
export EDITOR='vim'             # default editor

### aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
