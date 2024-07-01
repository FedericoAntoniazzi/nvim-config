return {
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdateSync',
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    event = { "VeryLazy" },
    config = function()
      require('configs.treesitter')
    end
  },

  -- Git
  {
    'lewis6991/gitsigns.nvim',
    event = { "VeryLazy" },
    config = function()
      require('configs.gitsigns')
    end
  },

  -- Language server
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('configs.lspconfig')
    end
  },

  -- Completion engine
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'L3MON4D3/LuaSnip',         -- Snippet engine
      'hrsh7th/cmp-path',         -- source for path
      'hrsh7th/cmp-buffer',       -- source for buffer words
      'hrsh7th/cmp-cmdline',      -- source for vim's cmdline
      'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
      'ray-x/cmp-treesitter',     -- source for treesitter
      'saadparwaiz1/cmp_luasnip', -- Completion source for LuaSnip
    },
    config = function()
      require('configs.autocompletion')
    end
  },

  -- Yaml companion
  {
    "someone-stole-my-name/yaml-companion.nvim",
    -- event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
    end,
    keys = {
      { "<leader>y", ":Telescope yaml_schema<CR>", mode = "n", desc = "Choose YAML Schema" },
    },
  },
}
