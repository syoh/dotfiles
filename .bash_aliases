alias ll='ls -alF'
alias la='ls -AF'
alias  l='ls -CF'

### network status

alias getmyip="host myip.opendns.com resolver1.opendns.com | grep -oP '(?<=^myip.opendns.com has address ).+(?=$)'"

getdnsfunc() {
    echo $(nmcli device show wlp2s0 | grep 'IP4.DNS\[1\]' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
}
alias getdns=getdnsfunc

### pdf editing

# removes white spaces from pdf
trimfunc() {
    convert -trim $1 $1
}
alias trim=trimfunc

# remove first page of pdf file
rmpage1func() {         
    pdftk "$1" cat 2-end output "$1--" && cp "$1--" "$1"
}
alias rmpage1=rmpage1func

### version control

alias -s yml=vim            # entring yml filename opens them in vim
alias yacp="yadm add -u && yadm commit && yadm push"
alias ycp="yadm commit && yadm push"
alias yst="yadm status"

alias gacp="git add -u && git commit && git push"
alias gcp="git commit && git push"
alias gst="git status"

### Jupyter book

# watch, build, and serve jupyter-book locally
alias jbs='mkdir -p _static && wget -nc -O _static/live.js https://livejs.com/live.js; python -m http.server --directory _build/html 2>/dev/null &; while inotifywait -re modify --exclude='_build' .; do jb build .; done'
alias jbc='rm _static/live.js; rmdir _static'
