require('hop').setup({
  case_insensitive = true,
  char2_fallback_key = '<CR>',
  quit_key='<Esc>',
})

vim.keymap.set('n', 'f', function()
  return require('hop').hint_char1()
end,
{ silent = true, noremap = true, desc = "nvim-hop char1" })

vim.keymap.set('n', 's', function()
  return require('hop').hint_words()
end,
{ silent = true, noremap = true, desc = "nvim-hop words" })
