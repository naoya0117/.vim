#!/bin/bash

! [ -f ~/.vimrc ] && touch ~/.vimrc 
[ -z "$(grep vim_runtime ~/.vimrc)" ] && echo "source ~/.vim_runtime/init.vim" >> ~/.vimrc

