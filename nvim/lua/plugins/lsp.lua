return {
  {
    "nvim-treesitter/nvim-treesitter",
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
    event = "LspAttach",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    config = require("config.lspsaga").config,
  },
  {
    "zbirenbaum/copilot.lua",
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
