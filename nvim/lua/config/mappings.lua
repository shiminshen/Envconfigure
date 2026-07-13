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
vim.keymap.set('x', '>', '>gv', { noremap = true, silent = true })
vim.keymap.set('x', '<', '<gv', { noremap = true, silent = true })

-- Map space to :
vim.keymap.set('n', ';', ':', { noremap = true, silent = true })

-- Map <Leader>w to write file
vim.keymap.set('n', '<Leader>w', ':w<CR>')

-- BufferLineCycleNext and BufferLineCyclePrev mappings
vim.keymap.set('n', '<C-k>', ':BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<C-j>', ':BufferLineCyclePrev<CR>', { silent = true })

-- BufferLineMoveNext and BufferLineMovePrev mappings
vim.keymap.set('n', '<C-l>', ':BufferLineMoveNext<CR>', { silent = true })
vim.keymap.set('n', '<C-h>', ':BufferLineMovePrev<CR>', { silent = true })
