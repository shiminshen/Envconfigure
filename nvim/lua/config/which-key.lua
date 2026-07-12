local wk = require("which-key")

-- Keymap group labels only. The Lspsaga mappings themselves live in the
-- lspsaga spec's `keys` (lua/plugins/lsp.lua) so the plugin lazy-loads
-- correctly when any of them is pressed.
wk.add({
  { "<leader>l", group = "LSP" },
})
