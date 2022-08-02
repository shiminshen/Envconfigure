colorscheme tokyonight

set ignorecase
set smartcase

" set space for indentLine
set tabstop=2
set expandtab
" set the space of indent
set shiftwidth=2

let mapleader = "\<Space>"
" map Visual mode blockwise indent
vmap > >gv
vmap < <gv
" map space to :
nnoremap ; :
" map <Leader>w to  write file
nnoremap <Leader>w :w<CR>

" set the backspace can delete characters in insert mode
set backspace=indent,eol,start

" set color on vim74
syntax enable
