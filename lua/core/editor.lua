-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.shiftround = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.showmatch = true

-- Syntax
vim.syntax = "on"
vim.filetype.plugin = true
vim.filetype.indent = true

-- Disable automatic saving on buffer change
vim.opt.autowrite     = false

-- Do not wrap the text
vim.opt.wrap          = false
