return {
  {
    -- File explorer
    "nvim-tree/nvim-tree.lua",
    version = "^v1",
    lazy = false,
    keys = {
      -- Toggle file explorer
      {"<C-n>", ":NvimTreeToggle<CR>", desc="Toggle file explorer", mode="n", silent=true, noremap=true}
    },
    config = function()
      require('plugins.configs.nvimtree')
    end
  }
}
