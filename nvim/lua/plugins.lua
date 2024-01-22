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
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end
  },
  
  -- install without yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
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

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
    config = function()
      require("flash").setup({
        search = {
          incremental = true,
        },
        modes = {
          char = {
            -- disabled char by using jump for f in keys
            enabled = false,
            -- jump_labels = true
          }
        }
      })
    end
  },
  
  -- FIXME tmp patch for hop in searching
  -- { 'easymotion/vim-easymotion' },

  -- file explorer
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
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

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
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
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('config.bufferline')
    end
  },

}
