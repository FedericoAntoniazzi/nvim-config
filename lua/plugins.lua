local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- [THEME] Catppuccin on Linux
  {
    'catppuccin/nvim',
    name = "catppuccin",
    cond = vim.loop.os_uname().sysname == "Linux",
    lazy = false,
    config = function()
      require('themes.catppuccin')
    end,
  },
  -- [THEME] OneDark on MacOS
  {
    'navarasu/onedark.nvim',
    cond = vim.loop.os_uname().sysname == "Darwin",
    lazy = false,
    config = function()
      require('themes.onedark')
    end,
  },

  -- [UI] Buffer bar
  {
    'akinsho/bufferline.nvim',
    version = "v4.*",
    lazy = false,
    config = function()
      require('config.bufferbar')
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {"]b", ":BufferLineMoveNext<CR>", mode = "n", desc = "Move right current buffer"},
      {"[b", ":BufferLineMovePrev<CR>", mode = "n", desc = "Move left current buffer"},
      {"<C-,>", ":BufferLineCyclePrev<CR>", mode = "n", desc = "View the previuos buffer"},
      {"<C-.>", ":BufferLineCycleNext<CR>", mode = "n", desc = "View the next buffer"},
    }
  },

  -- [UI] Status line
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/lsp-status.nvim",
    },
    config = function()
      require('config.statusline')
    end
  },

  {
    'nvim-tree/nvim-web-devicons',
    lazy = true
  },

  -- [FILE EXPLORER]
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    keys = {
      -- Toggle file explorer
      {"<C-n>", ":NvimTreeToggle<CR>", desc = "Toggle file explorer", mode = "n", silent = true, noremap = true},
    },
    config = function()
      require('config.fileexplorer')
    end
  },

  -- [CODE UTILS]
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdateSync',
    event = {"BufReadPost", "BufNewFile"},
    config = function()
      require('config.treesitter')
    end
  },

  -- Comments
  'tpope/vim-commentary',

  -- Auto pair parenthesis, brackets and so on
  {
    'windwp/nvim-autopairs',
    config = function()
      require('config.autopair')
    end
  },

  -- Completion engine
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'L3MON4D3/LuaSnip', -- Snippet engine
      'hrsh7th/cmp-path', -- source for path
      'hrsh7th/cmp-buffer', -- source for buffer words
      'hrsh7th/cmp-cmdline', -- source for vim's cmdline
      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      'ray-x/cmp-treesitter', -- source for treesitter
      'saadparwaiz1/cmp_luasnip', -- Completion source for LuaSnip
    },
    version = "2.2.x",
    config = function()
      require('config.completion')
    end
  },

  -- Language server
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('config.lsp')
    end
  },

  -- Show function/method signature
  {
    'ray-x/lsp_signature.nvim',
    event = "VeryLazy",
    lazy = true
  },

  -- Git
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('config.gitsymbols')
    end
  },
  {
    'akinsho/git-conflict.nvim',
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    config = true
  },

  -- Quick text search
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },

  -- Go language support
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter *.go"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

  -- Yaml companion
  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function ()
      require("telescope").load_extension("yaml_schema")
    end,
    keys = {
      {"<leader>y", ":Telescope yaml_schema<CR>", mode = "n", desc = "Choose YAML Schema"},
    },
  },

  -- Ansible support
  {
    'pearofducks/ansible-vim',
    lazy = true,
    ft = {"ansible", "ansible_hosts", "yaml.ansible", "jinja2"},
  }

}

local opts = {}

return require("lazy").setup(plugins, opts)
