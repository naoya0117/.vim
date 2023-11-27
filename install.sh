#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0) ; pwd)

isPathCorrect() {
    if [[ ${SCRIPT_DIR} == "${HOME}/.vim_runtime" ]] ; then
        echo "path check is done."
        return 0
    fi
    echo "path check is failed."
    echo "you need to clone vim_runtime as ~/.vim_runtime"
    echo "run \"git clone https://github.com/naoya0117/vim_runtime.git ~/.vim_runtime\""
    return 1
}

isVimruntimeLoaded () {
    if [ -n "$(grep .vim_runtime ~/.vimrc)" ] ; then
        echo "vim_runtime is already loaded"
        return 0
    fi
    return 1
}

installModule () {
    cd ${SCRIPT_DIR}
    echo "installing modules..."
    git submodule update --init --recursive
}

if ! [ -f ~/.vimrc ] ; then
    touch ~/.vimrc
fi


if isPathCorrect ; then
    echo "path check is done"
else
    exit 1
fi

installModule

if ! isVimruntimeLoaded ; then
    echo "updatint vimrc..."
    echo "source ~/.vim_runtime/init.vim" >> ~/.vimrc
fi
