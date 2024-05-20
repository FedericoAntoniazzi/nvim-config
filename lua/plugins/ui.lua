return {
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    version = "^v1",
    lazy = false,
    keys = {
      -- Toggle file explorer
      {"<C-f>", ":NvimTreeToggle<CR>", desc="Toggle file explorer", mode="n", silent=true, noremap=true}
    },
    config = function()
      require('plugins.configs.nvimtree')
    end
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/lsp-status.nvim",
    },
    config = function()
      require('plugins.configs.lualine')
    end
  },

  -- Buffer line
  {
    'akinsho/bufferline.nvim',
    -- version = "^v4",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {"]b", ":BufferLineMoveNext<CR>", mode = "n", desc = "Move right current buffer", silent=true},
      {"[b", ":BufferLineMovePrev<CR>", mode = "n", desc = "Move left current buffer", silent=true},
      {"<C-n>", ":BufferLineCyclePrev<CR>", mode = "n", desc = "View the previuos buffer", silent=true},
      {"<C-m>", ":BufferLineCycleNext<CR>", mode = "n", desc = "View the next buffer", silent=true},
    },
    config = function()
      require('plugins.configs.bufferline')
    end
  }
}
