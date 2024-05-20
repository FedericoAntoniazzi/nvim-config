return {
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdateSync',
    cmd = {"TSUpdateSync", "TSUpdate", "TSInstall"},
    event = {"VeryLazy"},
    config = function()
      require('configs.treesitter')
    end
  },
  -- Git
  {
    'lewis6991/gitsigns.nvim',
    event = {"VeryLazy"},
    config = function()
      require('configs.gitsigns')
    end
  },
}
