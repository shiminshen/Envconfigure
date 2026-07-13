return {
  {
    "echasnovski/mini.pairs",
    version = "*",
    config = function() require("mini.pairs").setup() end,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function() require("nvim-ts-autotag").setup({}) end,
  },
  -- (mini.comment removed: built-in gc commenting since nvim 0.10 covers it)
  { "max397574/better-escape.nvim", config = require("config.better-escape").config },
  { "gbprod/cutlass.nvim", opts = { cut_key = "m" } },
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()
      local set = vim.keymap.set
      set({ "n", "v" }, "<c-n>", function() mc.matchAddCursor(1) end)
      set({ "n", "v" }, "<c-x>", function() mc.matchSkipCursor(1) end)
      set({ "n", "v" }, "<leader><c-x>", function() mc.matchSkipCursor(-1) end)
      set({ "n", "v" }, "<c-down>", function() mc.lineAddCursor(1) end)
      set({ "n", "v" }, "<c-up>", function() mc.lineAddCursor(-1) end)
      set({ "n", "v" }, "<leader><c-down>", function() mc.lineSkipCursor(1) end)
      set({ "n", "v" }, "<leader><c-up>", function() mc.lineSkipCursor(-1) end)
      set("n", "<c-leftmouse>", mc.handleMouse)
      set({ "n", "v" }, "<leader><c-c>", mc.toggleCursor)
      mc.addKeymapLayer(function(layer)
        layer({ "n", "v" }, "<c-p>", function() mc.matchAddCursor(-1) end)
        layer({ "n", "v" }, "[c", mc.prevCursor)
        layer({ "n", "v" }, "]c", mc.nextCursor)
        layer({ "n", "v" }, "q", mc.deleteCursor)
        layer("n", "<esc>", function()
          if not mc.cursorsEnabled() then mc.enableCursors() else mc.clearCursors() end
        end)
      end)
      for name, value in pairs({
        MultiCursorCursor = { reverse = true },
        MultiCursorVisual = { link = "Visual" },
        MultiCursorSign = { link = "SignColumn" },
        MultiCursorMatchPreview = { link = "Search" },
        MultiCursorDisabledCursor = { reverse = true },
        MultiCursorDisabledVisual = { link = "Visual" },
        MultiCursorDisabledSign = { link = "SignColumn" },
      }) do vim.api.nvim_set_hl(0, name, value) end
    end,
  },
  "tpope/vim-repeat",
  { "echasnovski/mini.surround", version = "*", config = function() require("mini.surround").setup() end },
  -- flash.nvim replaces both leap.nvim (labeled jump on `f`) and
  -- vim-easymotion (n-char incremental search). Search mode hooks into the
  -- native `/`, so n/N, hlsearch, search history and noice all keep working;
  -- see mappings.lua for the <Tab>/<S-Tab> next/prev-match search motions.
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        search = {
          enabled = true, -- jump labels during native / search
          -- Two-phase flow (easymotion-style): type the pattern, press ;
          -- and the labels freeze — then press a label to jump. Before ;
          -- label keys are just search characters. The ; is stripped from
          -- the actual search pattern.
          search = { trigger = ";" },
        },
        char = { enabled = false }, -- leave F/t/T native (f is remapped below)
      },
    },
    keys = {
      { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter Select" },
      -- After a normal /search<Enter>, label every match of the last search
      -- (easymotion-style second phase without needing the ; trigger)
      {
        "g/",
        mode = { "n" },
        function()
          require("flash").jump({ pattern = vim.fn.getreg("/"), search = { mode = "search" } })
        end,
        desc = "Flash Labels for Last Search",
      },
    },
  },
  { "echasnovski/mini.cursorword", version = "*", config = function() require("mini.cursorword").setup() end },
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      { "<leader>sr", function() require("grug-far").open() end, mode = "n", desc = "Search and Replace" },
      { "<leader>sr", function() require("grug-far").open({ prefills = { search = require("grug-far").get_current_visual_selection() } }) end, mode = "v", desc = "Search selected text" },
    },
    opts = {},
  },
}
