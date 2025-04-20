"""""" FIXME easymotion searching
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

let g:coc_global_extensions = ['coc-tsserver', 'coc-snippets', 'coc-json', 'coc-eslint', 'coc-prettier-dev', '@yaegassy/coc-tailwindcss3', '@hexuhua/coc-copilot', 'coc-pyright']


"""""" coc-snippets
" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)
"
" " Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'
"
" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'
"
" " Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)
"
" " Use <leader>x for convert visual selected code to snippet
" xmap <leader>x  <Plug>(coc-convert-snippet)
"
" inoremap <silent><expr><c-l> coc#refresh()
"
" """""" coc-prettier
" command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
"
" """""" markdown-preview
" " let g:mkdp_auto_start = 1
