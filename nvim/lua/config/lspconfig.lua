local M = {}

M.config = function()
  require("mason").setup()
  local lsp_servers = require("config.lsp_servers")
  local lspconfig = require("lspconfig")
  local capabilities = require('blink.cmp').get_lsp_capabilities()

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

    lspconfig[server].setup(server_config)
  end
end

return M