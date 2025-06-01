local lsp_servers = require("config.lsp_servers")

return {
  mason = {},
  mason_lspconfig = {
    ensure_installed = lsp_servers,
  },
}
