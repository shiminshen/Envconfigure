local M = {}

-- Pick biome only in projects configured for it, prettier in prettier projects.
-- Mason keeps the biome binary on PATH everywhere, so a plain
-- { "biome", "prettier", stop_after_first = true } would always pick biome
-- and reformat prettier projects with biome defaults.
local function js_formatters(bufnr)
  local name = vim.api.nvim_buf_get_name(bufnr)
  local dir = name ~= "" and vim.fs.dirname(name) or vim.uv.cwd()
  if vim.fs.root(dir, { "biome.json", "biome.jsonc" }) then
    return { "biome" }
  end
  local prettier_markers = {
    ".prettierrc", ".prettierrc.json", ".prettierrc.yml", ".prettierrc.yaml",
    ".prettierrc.js", ".prettierrc.cjs", ".prettierrc.mjs",
    "prettier.config.js", "prettier.config.cjs", "prettier.config.mjs",
  }
  if vim.fs.root(dir, prettier_markers) then
    return { "prettierd", "prettier", stop_after_first = true }
  end
  -- No formatter config found: keep the previous default (biome)
  return { "biome" }
end

M.config = function()
  require('conform').setup({
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 2000,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      javascript = js_formatters,
      javascriptreact = js_formatters,
      typescript = js_formatters,
      typescriptreact = js_formatters,
      json = js_formatters,
      css = js_formatters,
      html = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },
      lua = { "stylua" },
      python = { "ruff_format", "black", stop_after_first = true },
      sh = { "shfmt" },
    },
  })
end

return M
