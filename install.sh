#!/bin/bash

# try this later: https://superuser.com/questions/39751/add-directory-to-path-if-its-not-already-there
LOCAL_BIN=$HOME/.local/bin
if [ ! -d $LOCAL_BIN ]
then
    mkdir -p $LOCAL_BIN
fi
export PATH=$LOCAL_BIN:$PATH

YADM_VERSION=3.3.0
wget https://github.com/TheLocehiliosan/yadm/archive/refs/tags/${YADM_VERSION}.tar.gz -O - \
    | tar xvzf - -C${LOCAL_BIN} yadm-${YADM_VERSION}/yadm --strip-components=1

yadm clone --bootstrap https://github.com/syoh/dotfiles.git