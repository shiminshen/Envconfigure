return {

  -- Colorscheme: Tokyo Night
  {
    'folke/tokyonight.nvim',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = require('config.tokyonight').config,
  },

  -- Code outline/symbols sidebar
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    config = require('config.aerial').config,
  },

  -- Auto pairs for brackets, quotes, etc.
  {
    'echasnovski/mini.pairs',
    version = '*',
    config = function()
      require('mini.pairs').setup()
    end
  },

  -- Auto close tag
  {
    'windwp/nvim-ts-autotag',
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require('nvim-ts-autotag').setup({})
    end
  },

  -- Comment plugin (toggle comments)
  {
    'echasnovski/mini.comment',
    version = '*',
    config = function()
      require('mini.comment').setup()
    end
  },

  -- Better escape from insert mode
  {
    "max397574/better-escape.nvim",
    config = require('config.better-escape').config,
  },

  -- Replace cut (d) with m for cutting
  {
    "gbprod/cutlass.nvim",
    opts = {
      cut_key = "m",
    }
  },

  -- Multiple cursors support
  { 'mg979/vim-visual-multi' },

  -- Repeat plugin: enables . to repeat more actions
  'tpope/vim-repeat',

  -- Git conflict resolution UI
  {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = function()
      require('git-conflict').setup()
    end
  },

  -- Highlight and search TODO, FIXME, etc. in code
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end
  },

  -- Markdown preview in browser
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Generate git links for code
  {
    'ruifm/gitlinker.nvim',
    config = function()
      require "gitlinker".setup()
    end
  },

  -- JSDoc generator
  {
    'kkoomen/vim-doge',
    run = ':call doge#install()'
  },

  -- Surround text objects easily
  {
    'echasnovski/mini.surround',
    version = '*',
    config = function()
      require('mini.surround').setup()
    end
  },


  -- Leap: fast navigation
  {
    "ggandor/leap.nvim",
    config = function(_, opts)
      local leap = require("leap")
      vim.keymap.set({ 'n', 'x', 'o' }, 'f', function()
        require('leap').leap { target_windows = { vim.api.nvim_get_current_win() } }
      end)
    end,
  },

  -- EasyMotion: quick cursor movement
  { 'easymotion/vim-easymotion' },

  -- Git integration (signs, hunk actions)
  {
    'lewis6991/gitsigns.nvim',
    config = require('config.gitsigns').config,
  },

  -- -- Highlight word under cursor
  {
    'echasnovski/mini.cursorword',
    version = '*',
    config = function()
      require('mini.cursorword').setup()
    end
  },

  -- snacks not support (need telescope)
  -- Quick buffer navigation
  -- {
  --   "ThePrimeagen/harpoon",
  --   event = "VimEnter",
  --   config = require('config.harpoon').config,
  -- },

  -- UI/UX enhancements (pickers, notifications, etc.)
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = require('config.snacks').opts,
    keys = require('config.snacks').keys,
    init = require('config.snacks').init,
  },

  {
    'nvimdev/lspsaga.nvim',
    config = require('config.lspsaga').config,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
    }
  },

  -- Enhanced notifications, command line, and LSP UI (replace by snacks.nvim)
  -- NOTE: noice.nvim is conflic with easymotion search
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module=\"...\"` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   },
  --   config = require('config.noice').config,
  -- },

  -- Show key bindings hint
  {
    'folke/which-key.nvim',
    config = function()
      require('config.which-key')
    end,
  },

  -- Better syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = require('config.treesitter').config,
  },

  -- Mason: LSP/DAP/Formatter/Linter manager and LSP integration
  {
    "mason-org/mason.nvim",
    opts = require('config.mason').mason,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = require('config.mason').mason_lspconfig,
    dependencies = {
      { "mason-org/mason.nvim", opts = require('config.mason').mason },
      "neovim/nvim-lspconfig",
    },
  },

  -- Blink completion
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      { 'L3MON4D3/LuaSnip', version = 'v2.*' },
      {
        'fang2hou/blink-copilot',
        dependencies = { 'zbirenbaum/copilot.lua' }
      }
    },
    version = '1.*',
    opts = require('config.blink').opts,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      'saghen/blink.cmp',
    },
    config = require('config.lspconfig').config,
  },

  -- -- React snippets
  -- {'mlaursen/vim-react-snippets'},
  -- -- Snippet collection
  -- {'honza/vim-snippets'},
  -- -- ES6 snippets
  -- {'isRuslan/vim-es6'},

  -- Show upper buffer line
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = require('config.bufferline').config,
  },

  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },


  -- LuaSnip: Snippet engine (enabled for nested snippet navigation)
  {
    'L3MON4D3/LuaSnip',
    version = "*",
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = require('config.luasnip').config,
  },
  -- -- friendly-snippets: Community snippet collection (used by blink.cmp)
  -- {
  --   'rafamadriz/friendly-snippets',
  --   lazy = true,
  -- },


  -- Formatter: conform.nvim
  {
    'stevearc/conform.nvim',
    opts = {},
    config = require('config.conform').config,
  },

}
