-- Set up the Copilot key mappings in insert mode
-- NOT WORKING
vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>(copilot-next)', {silent = true})
vim.api.nvim_set_keymap('i', '<C-k>', '<Plug>(copilot-previous)', {silent = true})
-- vim.api.nvim_set_keymap('i', '<C-\\>', '<Plug>(copilot-dismiss)', {silent = true})
