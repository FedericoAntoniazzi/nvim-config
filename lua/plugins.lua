-- Make sure packer.nvim is installed
-- Useful when cloning the dotfiles repo in multiple hosts
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
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
    config = function ()
      require('icons')
    end
  }
  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function ()
      require('statusline')
    end
  }
  -- Buffer line
  -- This functionality is out of scope of lualine
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function ()
      require('bufferbar')
    end
  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function ()
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
    config = function ()
      require('telescopeconf')
    end
  }

  -- LSP setup
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require("lsp.lspconfig")
    end
  }

  -- Completion
  use {
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    config = function()
      require "completion"
    end,
    wants = "LuaSnip",
    requires = {
      {
        "L3MON4D3/LuaSnip",
        wants = "friendly-snippets",
        event = "InsertCharPre",
      },
      {
        "rafamadriz/friendly-snippets",
        event = "InsertCharPre",
      },
    },
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
    after = 'nvim-compe',
    config = function ()
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
end)
