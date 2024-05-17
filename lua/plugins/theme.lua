return {
  {
    'catppuccin/nvim',
    name = "catppuccin",
    lazy = false,
    config = function()
      require('plugins.configs.catppuccin')
    end,
  },
}
