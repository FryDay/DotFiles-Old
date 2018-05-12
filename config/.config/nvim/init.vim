syntax enable
filetype plugin indent on

if &compatible
  set nocompatible
endif
filetype off
" append to runtime path
set rtp+=/usr/share/vim/vimfiles
" initialize dein, plugins are installed to this directory
call dein#begin(expand('~/.cache/dein'))
" add packages here, e.g:
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-go', {'build': 'make'})
call dein#add('w0rp/ale')
call dein#add('qwelyt/TrippingRobot')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-scripts/Auto-Pairs')
" exit dein
call dein#end()
" auto-install missing packages on startup
if dein#check_install()
  call dein#install()
endif
filetype plugin on

if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
endif

" Highlight current line
" set cursorline

" Don't nag about unwritten changes
set hidden
" Disable another annoying message. Don't forget to save your work often!
set noswapfile

" Show relative line numbers and show actual line number on current line
set relativenumber number

" Show the line and column number of the cursor position, separated by a comma
set ruler

" Keep 8 screen lines above/below the cursor if possible
set scrolloff=8

" Show current command at the bottom line of screen
set showcmd

" Highlight matching bracket when cursor is on one of them
set showmatch

" Always show tabline
set showtabline=2

" Wrap long line, don't break words
set wrap linebreak

" Ignore case when searching ...
set ignorecase
" ... unless search pattern contains upper case characters
set smartcase

set expandtab

set tabstop=4

set smartindent

""" Keymaps
" Like C and D, yank from cursor to end of line
nnoremap Y y$
" Move over wrapped lines the same as normal lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" Move to end / beginning of visual (wrapped or normal) line
nnoremap & g&
nnoremap $ g$
nnoremap 0 g0
" Copy/paste and move cursor to end of last operated text or end of putted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" Auto center on search match
noremap n nzz
noremap N Nzz

""" Auto commands
" Toggle hl off when entering insert mode ...
autocmd InsertEnter * :setlocal nohlsearch
" ... Toggle back on when leaving
autocmd InsertLeave * :setlocal hlsearch

""" Abbreviations
" Some common and easy mistakes when typing commands:
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Tabe tabe

" Golang
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
" let g:airline#extensions#ale#enabled = 1
let g:go_auto_type_info = 1
au FileType go nmap <F12> <Plug>(go-def)
let g:go_addtags_transform = "snakecase"
