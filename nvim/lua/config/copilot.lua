-- Set up the Copilot key mappings in insert mode
-- NOT WORKING
-- vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>(copilot-next)', {silent = true})
vim.api.nvim_set_keymap('i', '<C-k>', '<Plug>(copilot-previous)', {silent = true})
-- vim.api.nvim_set_keymap('i', '<C-\\>', '<Plug>(copilot-dismiss)', {silent = true})

-- vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false
-- })

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
