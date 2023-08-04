local theme = "catppuccin"

if (vim.loop.os_uname().sysname == "Darwin") then
  theme = "onedark"
end

require('lualine').setup {
  options = {
    theme = theme
  },
  sections = {
    lualine_x = {"require'lsp-status'.status()", 'filetype'},
  }
}
