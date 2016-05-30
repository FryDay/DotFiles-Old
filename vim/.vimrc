set nocompatible
set expandtab
set tabstop=4
set nu
syntax on
filetype off

filetype plugin indent on    " required

set grepprg=grep\ -nH\ $*
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
