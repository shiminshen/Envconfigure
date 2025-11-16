local M = {}

M.config = function()
  require("mason").setup()
  local lsp_servers = require("config.lsp_servers")
  local capabilities = require('blink.cmp').get_lsp_capabilities()

  -- Use the new vim.lsp.config API (nvim 0.11+)
  for _, server in ipairs(lsp_servers) do
    local server_config = {
      capabilities = capabilities
    }

    -- Special configuration for vtsls to support tsconfig path aliases
    if server == "vtsls" then
      server_config.settings = {
        vtsls = {
          enableMoveToFileCodeAction = true,
          autoUseWorkspaceTsdk = true,
        },
        typescript = {
          updateImportsOnFileMove = { enabled = "always" },
          preferences = {
            importModuleSpecifier = "non-relative",
            importModuleSpecifierEnding = "minimal",
            useAliasesForRenames = true,
            includePackageJsonAutoImports = "auto",
          },
          suggest = {
            completeFunctionCalls = true,
            includeCompletionsForModuleExports = true,
            autoImports = true,
          },
        },
        javascript = {
          updateImportsOnFileMove = { enabled = "always" },
          preferences = {
            importModuleSpecifier = "non-relative",
            importModuleSpecifierEnding = "minimal",
            useAliasesForRenames = true,
            includePackageJsonAutoImports = "auto",
          },
          suggest = {
            completeFunctionCalls = true,
            includeCompletionsForModuleExports = true,
            autoImports = true,
          },
        },
      }
    end

    -- Configure and enable the LSP server using the new API
    vim.lsp.config(server, server_config)
    vim.lsp.enable(server)
  end
end

return M