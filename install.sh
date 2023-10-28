#!/bin/bash

LOCAL_BIN=$HOME/.local/bin
if [ ! -d $LOCAL_BIN ]
then
    mkdir -p $LOCAL_BIN
    export PATH=$LOCAL_BIN:$PATH
fi

RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

GH_VERSION=2.30.0
wget https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_amd64.tar.gz -O - \
    | tar xvzf - -C${LOCAL_BIN} gh_${GH_VERSION}_linux_amd64/bin/gh --strip-components=2

YADM_VERSION=3.2.2
wget https://github.com/TheLocehiliosan/yadm/archive/refs/tags/${YADM_VERSION}.tar.gz -O - \
    | tar xvzf - -C${LOCAL_BIN} yadm-${YADM_VERSION}/yadm --strip-components=1

if command -v compaudit &> /dev/null
then
    compaudit | xargs chmod g-w,o-w
fi