set nocompatible              " be iMproved, required
set expandtab
set tabstop=4
set nu
syntax on
filetype off                  " required

filetype plugin indent on    " required

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
