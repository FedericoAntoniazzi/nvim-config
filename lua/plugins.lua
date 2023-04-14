local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd 'packadd packer.nvim'
end

-- Automatically compile changes when this file is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Catppuccin theme
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      require('themes.catppuccin')
    end,
    cond = function()
      return vim.loop.os_uname().sysname == "Linux"
    end
  }

  -- OneDark theme
  use {
    'navarasu/onedark.nvim',
    config = function()
      require('themes.onedark')
    end,
    cond = function()
      return vim.loop.os_uname().sysname == "Darwin"
    end
  }

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons', opt = true
    },
    config = function()
      require('config.statusline')
    end
  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', opt = true
    },
    config = function()
      require('config.fileexplorer')
    end
  }

  -- Buffer bar
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('config.bufferbar')
    end
  }

  -- Git symbols
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('config.gitsymbols')
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('config.treesitter')
    end
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('config.lsp')
    end
  }

  -- Completion engine
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer', -- source for buffer words
      'hrsh7th/cmp-path', -- source for path
      'hrsh7th/cmp-cmdline', -- source for vim's cmdline
      'ray-x/cmp-treesitter', -- source for treesitter
      'saadparwaiz1/cmp_luasnip', -- Completion source for LuaSnip
      'L3MON4D3/LuaSnip', -- Snippet engine
    },
    config = function()
      require('config.completion')
    end
  }

  -- Auto pair parenthesis, brackets and so on
  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function()
      require('config.autopair')
    end
  }

  -- Show function/method signature
  use {
    'ray-x/lsp_signature.nvim',
    after = 'nvim-cmp'
  }

  -- Go language support
  use {
    'fatih/vim-go',
    run = ':GoInstallBinaries',
  }

  -- Ansible support
  use 'pearofducks/ansible-vim'

  -- Comments
  use 'tpope/vim-commentary'

  -- Quick text search
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }
end)
