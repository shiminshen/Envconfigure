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

  -- Git integration (signs, hunk actions) (已被 snacks.nvim 取代)
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
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
            "<leader>uc")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle.option("backgrounk<leader>uh")
          Snacks.toggle.indent():map("<leader>ug")
          Snacks.toggle.dim():map("<leader>uD")
        end,
      })
    end,
  },

  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        lightbulb = {
          enable = false,
        },
        rename = {
          in_select = false,
        }
      })
    end,
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
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      { "ms-jpq/coq_nvim",       branch = "coq",      build = ":COQdeps" },
      { "ms-jpq/coq.artifacts",  branch = "artifacts" },

      { "ms-jpq/coq.thirdparty", branch = "3p" },
    },
    init = function()
      -- 🐓 Coq completion settings

      -- Disable recommended keymaps so we can define custom ones
      vim.g.coq_settings = {
        auto_start = true, -- if you want to start COQ at startup
        keymap = {
          recommended = false,
          pre_select = true,
        },
        display = {
          ghost_text = {
            enabled = false,
          },
        },
        clients = {
          snippets = {
            weight_adjust = 5.0
          }
        }
      }

      -- Keybindings
      vim.api.nvim_set_keymap('i', '<Esc>', [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
      vim.api.nvim_set_keymap('i', '<C-c>', [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], { expr = true, silent = true })
      vim.api.nvim_set_keymap('i', '<BS>', [[pumvisible() ? "\<C-e><BS>"  : "\<BS>"]], { expr = true, silent = true })

      -- Keep default <CR> (Enter) behavior for newlines
      vim.api.nvim_set_keymap('i', '<CR>', [[pumvisible() ? "\<C-e><CR>" : "\<CR>"]], { expr = true, silent = true })

      -- Use <C-j> to confirm completion
      vim.api.nvim_set_keymap(
        'i',
        '<C-j>',
        [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
        { expr = true, silent = true }
      )

      -- Use <Tab> / <S-Tab> to navigate completion menu
      vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
      vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })
    end,
    config = function()
      require("mason").setup()
      local lsp_servers = require("config.lsp_servers")
      local lspconfig = require("lspconfig")
      local coq = require("coq")

      for _, server in ipairs(lsp_servers) do
        lspconfig[server].setup(coq.lsp_ensure_capabilities({}))
      end
    end,
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

  -- AI assistant integration
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    opts = {
      -- add any opts here
      provider = 'openai',
    },
    build = ":AvanteBuild", -- This is optional, recommended tho. Also note that this will block the startup for a bit since we are compiling bindings in Rust.
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",      -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to setup it properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  -- LuaSnip: Snippet engine
  {
    'L3MON4D3/LuaSnip',
    version = "*",
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = require('config.luasnip').config,
  },
  -- friendly-snippets: Community snippet collection
  {
    'rafamadriz/friendly-snippets',
    lazy = true,
  },

  -- Formatter: conform.nvim
  {
    'stevearc/conform.nvim',
    opts = {},
    config = require('config.conform').config,
  },

}
