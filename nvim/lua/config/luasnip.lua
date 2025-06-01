local M = {}

M.config = function()
  local luasnip = require('luasnip')
  -- Load friendly-snippets
  require('luasnip.loaders.from_vscode').lazy_load()

  -- -- Optional: set some recommended settings
  -- luasnip.config.set_config({
  --   history = true,
  --   updateevents = "TextChanged,TextChangedI",
  --   enable_autosnippets = true,
  -- })

  -- -- Keymaps for snippet navigation (example, can be customized)
  -- vim.keymap.set({"i", "s"}, "<C-k>", function() luasnip.expand_or_jump() end, {silent = true, desc = "LuaSnip expand or jump"})
  -- vim.keymap.set({"i", "s"}, "<C-j>", function() luasnip.jump(-1) end, {silent = true, desc = "LuaSnip jump back"})
  -- vim.keymap.set("i", "<C-l>", function()
  --   if luasnip.choice_active() then
  --     luasnip.change_choice(1)
  --   end
  -- end, {silent = true, desc = "LuaSnip next choice"})

end

return M
