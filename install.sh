#!/bin/bash

###############################################################
# Install Script for https://github.com/synergybest/music-sh #
#############################################################

if [[ "$OS" != "Darwin" ]]; then
    abort "The Music cli is only supported on mac currenly"
fi

echo "This will install the command for all users is that ok?"
read -r CONFIRMATION

function global_install() {
    mkdir -p /usr/local/bin/
    cd /usr/local/bin/ || exit 1
    curl -O https://raw.githubusercontent.com/SynergyBest/music-sh/main/music
    chmod +x music
    echo "Done! Please run the command \"exec -l $SHELL\""
    cd ~ || exit 1
    exit 0
}

function local_install() {
    mkdir -p ~/bin
    export PATH=$PATH:$HOME/bin
    cd ~/bin || exit 1
    curl -O https://raw.githubusercontent.com/SynergyBest/music-sh/main/music
    chmod +x music
    echo "Done! Please run the command \"exec -l $SHELL\""
    cd ~ || exit 1
    exit 0
}

function local_conf() {
    echo "Do you want to run a local install?"
    read -r LOCAL_CONFIRMATION
    if [[ ${LOCAL_CONFIRMATION,,} = yes ]]; then
        local_install
    elif [[ ${LOCAL_CONFIRMATION,,} = y ]]; then
        local_install
    elif [[ ${LOCAL_CONFIRMATION,,} = no ]]; then
        exit 1
    elif [[ ${LOCAL_CONFIRMATION,,} = n ]]; then
        exit 1
    else
        exit 1
    fi
}

if [[ ${CONFIRMATION,,} = yes ]]; then
    global_install
elif [[ ${CONFIRMATION,,} = y ]]; then
    gloabl_install
elif [[ ${CONFIRMATION,,} = no ]]; then
    local_conf
elif [[ ${CONFIRMATION,,} = yes ]]; then
    local_conf
else
    exit 1
fi

exit 0
