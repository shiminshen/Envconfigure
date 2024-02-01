-- Set ignorecase and smartcase
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set space for indentLine
vim.o.tabstop = 2
vim.o.expandtab = true

-- Set the space of indent
vim.o.shiftwidth = 2

-- Set mapleader to Space
vim.g.mapleader = ' '

-- Map Visual mode blockwise indent
vim.api.nvim_set_keymap('x', '>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<', '<gv', { noremap = true, silent = true })

-- Map space to :
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true, silent = true })

-- Map <Leader>w to write file
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
