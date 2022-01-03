export ZSH="/home/syoh/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13 # in days

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
plugins=(gh git vi-mode docker gcloud kubectl helm)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

trimfunc() {
    convert -trim $1 $1
}
alias trim=trimfunc
alias getmyip="host myip.opendns.com resolver1.opendns.com | grep -oP '(?<=^myip.opendns.com has address ).+(?=$)'"
alias screen='TERM=screen screen'

alias ll='ls -alF'
alias la='ls -AF'
alias  l='ls -CF'

# custom aliases
getdnsfunc() {
    echo $(nmcli device show wlp2s0 | grep 'IP4.DNS\[1\]' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
}
alias getdns=getdnsfunc
alias -s yml=vim            # entring yml filename opens them in vim
rmpage1func() {         
    pdftk "$1" cat 2-end output "$1--" && cp "$1--" "$1"
}
alias rmpage1=rmpage1func   # remove first page of pdf file

alias yacp="yadm add -u && yadm commit && yadm push"
alias ycp="yadm commit && yadm push"
alias yst="yadm status"

alias gacp="git add -u && git commit && git push"
alias gcp="git commit && git push"
alias gst="git status"

# watch, build, and serve jupyter-book locally
alias jbs='mkdir -p _static && wget -nc -O _static/live.js https://livejs.com/live.js; python -m http.server --directory _build/html 2>/dev/null &; while inotifywait -re modify --exclude='_build' .; do jb build .; done'
alias jbc='rm _static/live.js; rmdir _static'

# keyboard bindings
bindkey "jk" vi-cmd-mode

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/syoh/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/syoh/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/syoh/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/syoh/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

