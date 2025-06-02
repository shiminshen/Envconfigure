local M = {}

M.config = function()
  require('conform').setup({
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 2000,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      -- javascript = { "prettier" },
      -- javascriptreact = { "prettier" },
      -- typescript = { "prettier" },
      -- FIXME: prettier with plugin bug
      -- typescriptreact = { "biome", "prettier", stop_after_first = true },
      typescriptreact = { "biome" },
    },
  })
end

return M
