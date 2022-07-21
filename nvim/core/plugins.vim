" lua require('init')

"""""" telescope.nvim
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>e  <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <C-p>      <cmd>Telescope git_files<cr>

"""""" wilder.nvim
call wilder#setup({'modes': [':', '/', '?']})
