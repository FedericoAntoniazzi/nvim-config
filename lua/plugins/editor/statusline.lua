return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" }
      },
      extensions = {
        'nvim-tree',
      },
      tabline = {
        lualine_a = {
          {
            'buffers',
            mode = 2
          }
        }
      }
    }
  }
}
