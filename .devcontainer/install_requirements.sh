#!/bin/bash

mkdir -p ${HOME}/.local/bin

if [[ ! -e ~/.local/yadm-project ]]
then
    git clone https://github.com/TheLocehiliosan/yadm.git ~/.local/yadm-project && \
        ln -s ~/.local/yadm-project/yadm ~/.local/bin/yadm
fi