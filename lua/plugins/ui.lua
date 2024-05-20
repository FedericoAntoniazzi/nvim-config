return {
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    version = "^v1",
    event = {"VeryLazy"},
    keys = {
      -- Toggle file explorer
      {"<C-f>", ":NvimTreeToggle<CR>", desc="Toggle file explorer", mode="n", silent=true, noremap=true}
    },
    config = function()
      require('configs.nvimtree')
    end
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    event = {"VeryLazy"},
    dependencies = {
      "nvim-lua/lsp-status.nvim",
    },
    config = function()
      require('configs.lualine')
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
      require('configs.bufferline')
    end
  }
}
