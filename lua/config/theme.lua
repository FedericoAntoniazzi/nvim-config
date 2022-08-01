-- Highlight current line
vim.opt.cursorline = true

vim.opt.list = true
vim.opt.listchars = {
	tab = "| "
}

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
	transparent_background = true,
})

vim.cmd [[colorscheme catppuccin]]
