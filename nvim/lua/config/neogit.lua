local neogit = require('neogit')

neogit.setup {
  disable_commit_confirmation = true
}

vim.keymap.set('n', '<Leader>M', ':Neogit<CR>',  { noremap = true, silent = true })
