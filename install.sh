#!/bin/bash

dir_name=$(cd $(dirname $0) ; pwd | xargs basename)

( [[ "$dir_name" != ".vim_runtime" ]] || ! [ -d ~/.vim_runtime ] ) &&
	echo "you need to clone vim_runtime as ~/.vim_runtime" && exit 1

! [ -f ~/.vimrc ] && touch ~/.vimrc 
[ -n "$(grep .vim_runtime ~/.vimrc)" ] && echo "vim_runtime is already installed"
[ -z "$(grep .vim_runtime ~/.vimrc)" ] && echo "source ~/.vim_runtime/init.vim" >> ~/.vimrc

