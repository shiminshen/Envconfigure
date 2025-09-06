local M = {}

M.opts = {
  keymap = {
    preset = 'super-tab',
    -- Use C-j/C-k for navigation (replaces default C-p/C-n)
    ['<C-k>'] = { 'select_prev', 'fallback' },
    ['<C-j>'] = { 'select_next', 'fallback' },
    -- Use C-l for manual trigger (C-space conflicts with macOS input switching)
    ['<C-l>'] = { 'show', 'show_documentation', 'hide_documentation' },
    -- Use C-h to close popup (replaces default C-e)
    ['<C-h>'] = { 'hide', 'fallback' },
    -- Documentation scroll
    ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
  },
  appearance = { nerd_font_variant = 'mono' },
  completion = {
    documentation = { auto_show = true },
    ghost_text = {
      enabled = true,
    },
    -- Performance boost (default: prefetch_on_insert = false)
    trigger = {
      prefetch_on_insert = true,
      show_on_keyword = true,
      show_on_trigger_character = true,
    },
    menu = {
      delay = 0,
      draw = {
        treesitter = { "lsp" },
        -- Better column layout (default: basic columns)
        columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
      },
    },
  },
  sources = {
    default = { 'lsp', 'snippets', 'copilot', 'path', 'buffer' },
    -- Start completion from first character (default: min_keyword_length = 1)
    min_keyword_length = 0,
    providers = {
      snippets = {
        opts = {
          extended_filetypes = {
            typescript = { 'javascript' },
            typescriptreact = { 'javascript' },
          }
        }
      },
      copilot = {
        name = "copilot",
        module = "blink-copilot",
        -- score_offset = 100,
        async = true,
      }
    }
  },
  snippets = {
    -- Use LuaSnip instead of native vim.snippet to fix nested snippet navigation issues
    -- Issue: https://github.com/Saghen/blink.cmp/issues/906
    -- Native vim.snippet in Neovim 0.11+ causes tab navigation problems with nested snippets
    preset = 'luasnip',
  },
  signature = { enabled = true },
  fuzzy = { implementation = "prefer_rust_with_warning" }
}

return M

