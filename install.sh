#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0) ; pwd)

isModuleInstaled() {
    installed=$(ls ${SCRIPT_DIR}/bundle/*/ | grep -v bundle | wc -l)

    if [ $installed -gt 0 ] ; then
        echo "modules are already installed"
        return 0
    else
        echo "modules are not installed"
        return 1
    fi

}

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

if ! [ -f ~/.vimrc ] ; then
    touch ~/.vimrc
fi


if isPathCorrect ; then
    echo "path check is done"
else
    exit 1
fi

if ! isModuleInstaled  ; then
    echo "installing modules..."
    git submodule update --init --recursive
fi

if ! isVimruntimeLoaded ; then
    echo "updatint vimrc..."
    echo "source ~/.vim_runtime/init.vim" >> ~/.vimrc
fi
