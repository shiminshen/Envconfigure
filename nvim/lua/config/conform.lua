local M = {}

M.config = function()
  require('conform').setup({
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 2000,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
      typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
      json = { "biome", "prettierd", "prettier", stop_after_first = true },
      css = { "biome", "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },
      lua = { "stylua" },
      python = { "ruff_format", "black", stop_after_first = true },
      sh = { "shfmt" },
    },
  })
end

return M
