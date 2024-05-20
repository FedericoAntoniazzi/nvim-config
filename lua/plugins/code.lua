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
}
