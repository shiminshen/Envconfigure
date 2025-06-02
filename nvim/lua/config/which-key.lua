require("which-key").setup()

local wk = require("which-key")

-- OPTIONAL: Use snacks.nvim for select popups
-- Uncomment the next line if you use snacks.nvim
-- vim.ui.select = require("snacks.select").ui_select

wk.add({
  { "<leader>qf", function()
      vim.lsp.buf.code_action({ apply = true })
    end, desc = "Quickfix (auto apply first)" },
})
