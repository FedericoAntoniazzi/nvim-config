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

  -- Status line
  use {
    'hoob3rt/lualine.nvim',
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

  -- LSP Configuration
  use {
    'neovim/nvim-lspconfig',
    config = function ()
      require('lsp.lspconfig')
    end
  }

  -- Completion
  -- use {
  --   "hrsh7th/nvim-compe",
  --   event = "InsertEnter",
  --   config = function()
  --     require "completion"
  --   end,
  --   wants = "LuaSnip",
  --   requires = {
  --     {
  --       "L3MON4D3/LuaSnip",
  --       wants = "friendly-snippets",
  --       event = "InsertCharPre",
  --       config = function()
  --         require "snippets"
  --       end
  --     },
  --     {
  --       "rafamadriz/friendly-snippets",
  --       event = "InsertCharPre"
  --     }
  --   }
  -- }

  -- use {
  --   "ray-x/lsp_signature.nvim",
  --   after = "nvim-lspconfig",
  -- }

  -- use {
  --   "windwp/nvim-autopairs",
  --   after = "nvim-compe",
  --   config = function()
  --     require "pairs"
  --   end
  -- }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require "gitsymbols"
    end
  }
end)
