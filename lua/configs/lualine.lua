require('lualine').setup {
  options = {
    theme = "catppuccin"
  },
  sections = {
    lualine_x = {"require'lsp-status'.status()", 'filetype'},
  }
}
