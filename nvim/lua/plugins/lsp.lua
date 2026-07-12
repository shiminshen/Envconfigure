return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- master is frozen/archived; main is the rewrite
    lazy = false,
    build = ":TSUpdate",
    config = require("config.treesitter").config,
  },
  { "mason-org/mason.nvim", opts = require("config.mason").mason },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = require("config.mason").mason_lspconfig,
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
  },
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
      { "L3MON4D3/LuaSnip", version = "v2.*" },
      { "fang2hou/blink-copilot", dependencies = { "zbirenbaum/copilot.lua" } },
    },
    opts = require("config.blink").opts,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim", "saghen/blink.cmp" },
    config = require("config.lspconfig").config,
  },
  {
    "nvimdev/lspsaga.nvim",
    -- Lazy-load on its own keys/command instead of LspAttach, so the
    -- mappings work in any buffer without a startup :Lspsaga error.
    cmd = "Lspsaga",
    keys = {
      { "<leader>qf", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },
      { "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", desc = "Show Cursor Diagnostics" },
      { "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show Line Diagnostics" },
      { "<leader>rn", "<cmd>Lspsaga rename mode=n<CR>", desc = "Rename Symbol" },
      { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover Documentation" },
      { "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Previous Diagnostic" },
      { "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next Diagnostic" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    config = require("config.lspsaga").config,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot", -- keep :Copilot auth/status available before InsertEnter
    event = "InsertEnter",
    opts = { suggestion = { enabled = false }, panel = { enabled = false } },
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = require("config.luasnip").config,
  },
  { "stevearc/conform.nvim", config = require("config.conform").config },
}
