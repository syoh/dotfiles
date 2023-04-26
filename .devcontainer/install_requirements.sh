#!/bin/bash

mkdir -p ${HOME}/.local/bin

REQD=()
type -p zsh >/dev/null || REQD+=(zsh)
type -p git >/dev/null || REQD+=(git)

if [ -z "$REQD"]; then
    sudo apt update
    sudo apt install -y $REQD
fi

if [[ ! -e ~/.local/yadm-project ]]; then
    git clone https://github.com/TheLocehiliosan/yadm.git ~/.local/yadm-project && \
        ln -s ~/.local/yadm-project/yadm ~/.local/bin/yadm
fi