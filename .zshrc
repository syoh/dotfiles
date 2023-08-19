export PATH=$HOME/.local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=vim

plugins=(
    gh 
    git 
    gcloud
    zsh-vi-mode
    )

ZSH_THEME="robbyrussell"

# --- zsh-vi-mode ---
# https://github.com/jeffreytse/zsh-vi-mode#-usage
function zvm_config() {
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
