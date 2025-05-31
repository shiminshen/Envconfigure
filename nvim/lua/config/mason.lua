return {
  mason = {},
  mason_lspconfig = {
    ensure_installed = {
      "ts_ls",              -- TypeScript/JavaScript
      "html",               -- HTML
      "cssls",              -- CSS
      "jsonls",             -- JSON
      "yamlls",             -- YAML
      "eslint",             -- ESLint
      "tailwindcss",        -- Tailwind CSS
      "emmet_language_server", -- Emmet
      "marksman",           -- Markdown
      "lua_ls",             -- Lua (for Neovim config)
      "pyright",            -- Python (keep for fullstack)
      "bashls",             -- Bash (keep for scripting)
    },
  },
}
