set nocompatible
set expandtab
set tabstop=4
set hidden
set nu
syntax on
filetype off

filetype plugin indent on    " required

set grepprg=grep\ -nH\ $*
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" To open a new empty buffer
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>
