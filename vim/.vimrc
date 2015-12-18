set nocompatible              " be iMproved, required
set expandtab
set tabstop=4
set number
" set cursorline
set wildmenu
set showmatch
syntax on
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'jdonaldson/vaxe' " haxe support

call vundle#end()            " required
filetype plugin indent on    " required
