local wk = require("which-key")

wk.add({
  -- Group all LSP related keymaps under <leader>l
  { "<leader>l",  group = "LSP" },

  -- Code Action: shows available code actions in a popup (common: <leader>ca)
  -- { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },
  { "<leader>qf", "<cmd>Lspsaga code_action<CR>",                       desc = "Code Action" },

  -- Show diagnostics at the cursor position (common: <leader>cd)
  { "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics ++unfocus<CR>", desc = "Show Cursor Diagnostics" },

  -- Show diagnostics for the current line
  { "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>",             desc = "Show Line Diagnostics" },

  -- Rename symbol (classic binding: <leader>rn)
  { "<leader>rn", "<cmd>Lspsaga rename mode=n<CR>",                     desc = "Rename Symbol" },

  -- Hover documentation on the symbol under the cursor (common: K)
  { "K",          "<cmd>Lspsaga hover_doc<CR>",                         desc = "Hover Documentation" },

  -- -- Go to definition
  -- { "gd", "<cmd>Lspsaga goto_definition<CR>", desc = "Go to Definition" },
  --
  -- -- Peek definition (preview definition without jumping)
  -- { "gp", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },

  -- Jump to previous diagnostic
  { "[e",         "<cmd>Lspsaga diagnostic_jump_prev<CR>",              desc = "Previous Diagnostic" },

  -- Jump to next diagnostic
  { "]e",         "<cmd>Lspsaga diagnostic_jump_next<CR>",              desc = "Next Diagnostic" },
})
