return {
  { "akinsho/git-conflict.nvim", version = "*", config = function() require("git-conflict").setup() end },
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      { "<leader>sr", function() require("grug-far").open() end, mode = "n", desc = "Search and Replace" },
      { "<leader>sr", function() require("grug-far").open({ prefills = { search = require("grug-far").get_current_visual_selection() } }) end, mode = "v", desc = "Search selected text" },
    },
    opts = {},
  },
  { "lewis6991/gitsigns.nvim", config = require("config.gitsigns").config },
}
