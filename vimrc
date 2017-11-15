" map space to leader
let mapleader = "\<Space>"
" install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" start vim-plug
call plug#begin('~/.vim/plugged')
" My Bundles here:
Plug 'tpope/vim-fugitive'
" Plug 'kien/ctrlp.vim'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'flazz/vim-colorschemes'
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree' 

Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git', { 'do': './install.sh'  }
Plug 'https://github.com/rking/ag.vim.git'
Plug 'git://github.com/tpope/vim-surround.git' 
Plug 'https://github.com/Yggdroot/indentLine.git'
" Plug 'https://github.com/tomtom/tcomment_vim.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/rking/ag.vim.git'
Plug 'https://github.com/Chun-Yang/vim-action-ag.git'

" use * to search selected text in visual mode
vmap * <Plug>AgActionVisual

" Plug for git
Plug 'https://github.com/jreybert/vimagit.git'

" plug for generating jsdoc
Plug 'https://github.com/heavenshell/vim-jsdoc.git'
" plugin expand select region
Plug 'https://github.com/terryma/vim-expand-region.git'
" extension '.' repeat
Plug 'https://github.com/tpope/vim-repeat.git'
" plugin for extension clip
Plug 'https://github.com/svermeulen/vim-easyclip.git'
" plugin for align text
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" highlight the word under the cursor
Plug 'https://github.com/ihacklog/HiCursorWords.git'
" switch the position of split windows
Plug 'wesQ3/vim-windowswap'
" smooth C-F, C-B
Plug 'yonchu/accelerated-smooth-scroll'
" show git diff in the gutter
Plug 'mhinz/vim-signify'

" markdown syntax plugin
Plug 'https://github.com/plasticboy/vim-markdown.git'
" markdown realtime preview plugin
Plug 'https://github.com/suan/vim-instant-markdown.git'

Plug 'alvan/vim-closetag'
" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"

Plug 'isRuslan/vim-es6'

" plugin for javascript.
" Plug 'jelera/vim-javascript-syntax'
" Plug 'https://github.com/maksimr/vim-jsbeautify.git'
Plug 'pangloss/vim-javascript'

" better indent format
Plug 'Chiel92/vim-autoformat'

" jsx plugin
Plug 'maxmellon/vim-jsx-pretty'
" enable in .js files.
let g:jsx_ext_required = 0

Plug 'chemzqm/vim-jsx-improve'

" python indent
Plug 'hynek/vim-python-pep8-indent'

" plugin for buffer navigator 
" Plug 'https://github.com/jeetsukumaran/vim-buffergator.git'
Plug 'NLKNguyen/easy-navigate.vim'

" html autocomplete plugins
Plug 'https://github.com/mattn/emmet-vim.git'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" html highlight matched tags plugins
Plug 'https://github.com/Valloric/MatchTagAlways.git'

Plug 'w0rp/ale'

" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['standard'],
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

" smart colon and semicolon insert
Plug 'https://github.com/lfilho/cosco.vim.git'
" config cosco
command! CommaOrSemiColon call cosco#commaOrSemiColon()
autocmd FileType javascript,css,YOUR_LANG nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css,YOUR_LANG inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

"unite
Plug 'Shougo/vimproc.vim', { 'do': 'make'}
Plug 'https://github.com/Shougo/neomru.vim.git'
Plug 'https://github.com/Shougo/unite.vim.git'
" unite config
nnoremap <silent> <Leader>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>
nnoremap <Leader>b :Unite -buffer-name=buffers -winheight=10 buffer<cr>
noremap <Leader>f :Unite grep:.<cr>

" plugin for livescript
Plug 'https://github.com/gkz/vim-ls.git'
"autocomplie when saving files
"au BufWritePost *.ls silent LiveScriptMake!
au BufWritePost *.ls silent LiveScriptMake! | cwindow | redraw!
"syntax heighlighting for stylus 
Plug 'https://github.com/wavded/vim-stylus.git'
" compile when save
"nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

" multiple-cursors
Plug 'https://github.com/terryma/vim-multiple-cursors.git'

" react-snippets
" Plug 'justinj/vim-react-snippets'
Plug 'https://github.com/greg-js/vim-react-es6-snippets.git'

" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

Plug 'https://github.com/claco/jasmine.vim.git'

" automatic closing of parenthesis
" Plug 'https://github.com/Raimondi/delimitMate.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'

" You can specify revision/branch/tag.
Plug 'Shougo/vimshell', { 'rev' : '3787e5' }

call plug#end()

let NERDTreeShowHidden = 1
" use ctrl + n to open NERDTree
map <Leader>n :NERDTreeToggle<CR>

set encoding=utf-8
"enable 256 color in Vim
set t_Co=256
set mouse=nv
" set the underline of current cursor
set cursorline
" set auto indent
set ai           
" set for indentLine
set tabstop=2
set expandtab
" set the space of indent
set shiftwidth=2
" useful map
" map 'ii' and ';;' to esc
map! ii <Esc>
map! ;; <Esc>
vmap ii <Esc>
vmap ;; <Esc>
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

" set up omnifunction 
" set omnifunc=syntaxcomplete#Complete 

" return the position of last left
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" tagbar
nmap tb :TagbarToggle<CR>

" js-docs
nmap <silent> <C-l> <Plug>(jsdoc)
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1

" airline
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
set guifont=DroidSansMono_Nerd_Font:h22


set laststatus=2
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" easymotion
let g:EasyMotion_leader_key = '<Leader>'

" n-character search motion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" 2-character search motion
nmap s <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)
" easymotion line motion
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_smartcase = 1

" expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


"youcompleteme
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'
let g:EclimCompletionMethod = 'omnifunc'

"gvim
"set nocompatible
set background=dark
colorscheme gruvbox

"eclipse gvim
set guioptions-=m " turn off menu bar
set guioptions-=T " turn off toolbar
set guioptions-=L " turn off left scrollbar
set guioptions-=l

set guioptions-=m " turn off menu bar
set guioptions-=T " turn off toolbar
set guioptions-=L " turn off left scrollbar
set guioptions-=l

" set for crontab -e
autocmd filetype crontab setlocal nobackup nowritebackup
