set runtimepath^=~/.vim_runtime
execute pathogen#infect()

set autoindent
set expandtab
set ts=4
set shiftwidth=4
set ruler
set ignorecase
set noincsearch
set hlsearch
set nobackup
set viminfo=
set encoding=utf-8
set fileencodings=utf-8,euc-jp,cp932,default,latin
set ambiwidth=double
set shortmess+=I
set listchars=tab:>-


filetype on
filetype plugin on
filetype indent on

colorscheme molokai

set clipboard=unnamedplus,unnamed
set spell

syntax on
