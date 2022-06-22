-- Make sure packer.nvim is installed
-- Useful when cloning the dotfiles repo in multiple hosts
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Tokyonight theme
  use 'folke/tokyonight.nvim'

  -- Dev Icons
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('icons')
    end
  }
  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('statusline')
    end
  }
  -- Buffer line
  -- This functionality is out of scope of lualine
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferbar')
    end
  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('fileexplorer')
    end
  }

  -- Plenary
  use {
    "nvim-lua/plenary.nvim",
    after = "nvim-bufferline.lua",
  }

  -- Git signs
  use {
    'lewis6991/gitsigns.nvim',
    after = 'plenary.nvim',
    config = function()
      require "gitsymbols"
    end
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    after = 'plenary.nvim',
    config = function()
      require('telescopeconf')
    end
  }

  -- LSP setup
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require("lsp.config")
    end,
  }

  -- Completion
  use {
    "rafamadriz/friendly-snippets",
  }

  use "L3MON4D3/LuaSnip"

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      "ray-x/cmp-treesitter"
    },
    config = function()
      require('completion')
    end
  }

  -- Signature
  -- Show function/method signature
  use {
    'ray-x/lsp_signature.nvim',
    after = 'nvim-lspconfig'
  }

  -- Auto pair parenthes,brackets and so on...
  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function()
      require('pairs')
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = 'BufRead',
    config = function()
      require('treesitter')
    end
  }

  -- Lightbulb
  use {
    'kosayoda/nvim-lightbulb',
    config = function()
      require('lightbulb')
    end
  }

  -- Editorconfig (.editorconfig)
  use {
    "gpanders/editorconfig.nvim"
  }

  use {
    "pearofducks/ansible-vim"
  }

  use {
    "fatih/vim-go"
  }

  use "google/vim-jsonnet"

  use "hashivim/vim-hashicorp-tools"
end)
