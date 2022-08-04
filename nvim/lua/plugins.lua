-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Comment plugin
  use 'tpope/vim-commentary'

  use {'jdhao/better-escape.vim', event = 'InsertEnter'}

  -- replace clip to m from d
  use 'svermeulen/vim-easyclip'
  
  use 'terryma/vim-multiple-cursors'
  
  use 'tpope/vim-repeat'

  use 'folke/tokyonight.nvim'
  
  -- use { 'jreybert/vimagit' }
  use {
    'TimUntersberger/neogit',
    requires = { { 'nvim-lua/plenary.nvim' }, { 'sindrets/diffview.nvim' } },
    config = [[require('config.neogit')]],
  }
  
  use { 'lewis6991/impatient.nvim' }

  use { 'alvan/vim-closetag' } 
  
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end
  }
  
  use {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  }
  
  use {
    'ruifm/gitlinker.nvim',
    config = function()
      require"gitlinker".setup()
    end
  }

  -- Plugin to manipulate character pairs quickly
  -- use 'tpope/vim-surround'
  use {'machakann/vim-sandwich', event = 'VimEnter'}
  
  -- easymotion
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = [[require('config.hop')]]
  }

  -- FIXME tmp patch for hop in searching
  use { 'easymotion/vim-easymotion' }

  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = [[require('config.nvim-tree')]]
  }

  -- git integration
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release', -- To use the latest release
    config = [[require('config.gitsigns')]]
  }

  -- indent
  use {
   'lukas-reineke/indent-blankline.nvim', 
    config = [[require('config.bufferline')]]
  }

  -- file searching
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = [[require('config.telescope')]]
  }

  -- cmd autocomplete
  use {
    'gelguy/wilder.nvim',
    config = [[require('config.wilder')]]
  }

  -- show key bindings hint
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- better syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = [[require('config.treesitter')]]
  }

  use {
    'neoclide/coc.nvim',
    -- FIXME break change at v0.0.82
    tag = 'v0.0.81', 
    -- branch = 'release',
  }

  -- react snippet for coc-snippets
  use {'mlaursen/vim-react-snippets'}
  use {'honza/vim-snippets'}
  use {'isRuslan/vim-es6'}

  use {
    'akinsho/bufferline.nvim',
    tag = 'v2.*', 
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('config.bufferline')]]
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
