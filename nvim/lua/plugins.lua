return {
  
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  -- Comment plugin
  'tpope/vim-commentary',

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup {
        mapping = {"jk", "jj"}, -- a table with mappings to use
        timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
        clear_empty_lines = false, -- clear line after escaping if there is only whitespace
        keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
        -- example(recommended)
        -- keys = function()
          --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
          -- end,
        }
    end,
  },

  -- replace clip to m from d
  'svermeulen/vim-easyclip',
  
  -- 'terryma/vim-multiple-cursors'
  { 'mg979/vim-visual-multi' },
  
  'tpope/vim-repeat',

  {
    'TimUntersberger/neogit',
    dependencies = { { 'nvim-lua/plenary.nvim' }, { 'sindrets/diffview.nvim' } },
    config = function()
      require('config.neogit')
    end
  },
  
  {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = function()
      require('git-conflict').setup()
    end
  },
  
  { 'alvan/vim-closetag' },
  
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end
  },
  
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end
  },
  
  -- <leader>gy for normal and visual mode
  {
    'ruifm/gitlinker.nvim',
    config = function()
      require"gitlinker".setup()
    end
  },

  -- jsdoc generator
  {
    'kkoomen/vim-doge',
    run = ':call doge#install()'
  },

  -- Plugin to manipulate character pairs quickly
  -- 'tpope/vim-surround'
  {'machakann/vim-sandwich', event = 'VimEnter'},
  
  -- easymotion
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      require('config.hop')
    end
  },

  -- FIXME tmp patch for hop in searching
  { 'easymotion/vim-easymotion' },

  -- file explorer
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('config.nvim-tree')
    end
  },

  -- git integration
  {
    'lewis6991/gitsigns.nvim',
    version = 'v0.5', -- To the latest release
    config = function()
      require('config.gitsigns')
    end
  },

  -- indent
  {
    'lukas-reineke/indent-blankline.nvim', 
    config = function()
      require('ibl').setup()
    end
  },

  -- better buffer navigation
  {
    "ThePrimeagen/harpoon",
    event = "VimEnter",
    config = function()
      require('config.harpoon')
    end
  },

  -- file searching
  {
    'nvim-telescope/telescope.nvim', version = '0.1',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('config.telescope')
    end
  },

  -- cmd autocomplete
  {
    'gelguy/wilder.nvim',
    config = function()
      require('config.wilder')
    end
  },

  -- show key bindings hint
  {
    'folke/which-key.nvim',
    config = function()
      require('config.which-key')
    end
  },

  -- better syntax highlight
  {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require('config.treesitter')
    end
    
  },

  {
    'neoclide/coc.nvim',
    -- FIXME break change at v0.0.82
    branch = 'release',
  },
  
  -- github copilot
  {'github/copilot.vim'},

  -- react snippet for coc-snippets
  {'mlaursen/vim-react-snippets'},
  {'honza/vim-snippets'},
  {'isRuslan/vim-es6'},

  {'liuchengxu/vista.vim'},

  -- show upper buffer line
  {
    'akinsho/bufferline.nvim',
    version = 'v2.*', 
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('config.bufferline')
    end
  },

}
