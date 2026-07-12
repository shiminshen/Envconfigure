return {
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, config = require("config.tokyonight").config },
  {
    "stevearc/aerial.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    config = require("config.aerial").config,
  },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {} },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  { "kkoomen/vim-doge", build = ":call doge#install()" },
  {
    "dmtrKovalenko/fff.nvim",
    build = require("config.fff").build,
    lazy = false,
    opts = require("config.fff").opts,
    config = require("config.fff").config,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = require("config.snacks").opts,
    config = require("config.snacks").config,
    init = require("config.snacks").init,
  },
  { "folke/which-key.nvim", config = function() require("config.which-key") end },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = require("config.bufferline").config,
  },
}
