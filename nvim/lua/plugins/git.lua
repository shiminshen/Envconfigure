return {
  { "akinsho/git-conflict.nvim", version = "*", config = function() require("git-conflict").setup() end },
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
  { "lewis6991/gitsigns.nvim", config = require("config.gitsigns").config },
}
