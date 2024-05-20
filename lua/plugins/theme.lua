return {
  {
    'catppuccin/nvim',
    name = "catppuccin",
    lazy = false,
    config = function()
      require('configs.catppuccin')
    end,
  },
}
