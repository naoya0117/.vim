set runtimepath^=~/.vim_runtime



"plugin settings
let $CACHE = expand('~/.cache')
if !($CACHE->isdirectory())
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dir = 'dein.vim'->fnamemodify(':p')
  if !(s:dir->isdirectory())
    let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !(s:dir->isdirectory())
      execute '!git clone https://github.com/Shougo/dein.vim' s:dir
    endif
  endif
  execute 'set runtimepath^='
        \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endif
call dein#begin(s:dir)
call dein#add('vim-syntastic/syntastic')
call dein#add('lilydjwg/fcitx.vim')
call dein#add('github/copilot.vim')
call dein#end()


let fcitx5state=system("fcitx5-remote")
autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c " Disable the input method when exiting insert mode and save the state"
autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif " 2 means that the input method was opened in the previous state, and the input method is started when entering the insert mode"

filetype on
filetype plugin on
filetype indent on

colorscheme solarized

set clipboard=unnamedplus,unnamed
set spell

syntax on
