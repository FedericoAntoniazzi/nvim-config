vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
  transparent_background = true,
  integrations = {
    bufferline = true,
    gitsigns = true,
    nvimtree = {
      show_root = true,
      transparent_panel = true
    }
  }
})

vim.cmd [[colorscheme catppuccin]]
