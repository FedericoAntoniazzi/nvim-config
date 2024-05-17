local set = vim.opt

-- Enables 24-bit RGB colors
set.termguicolors = true

-- Highlight current line
set.cursorline = true

-- Show | on indented lines
set.list = true
set.listchars = {
  tab = '| '
}

-- Show row number
set.number = true
set.relativenumber = true

-- Disable row wrap
set.wrap = false

-- Configure indentation
set.autoindent = true
set.smartindent = true
set.shiftwidth = 4
set.tabstop = 4
set.smarttab = true
set.expandtab = false

-- Configure search
-- Case insentive
set.ignorecase = true
set.smartcase = true
-- Show and move to next search while typing
set.incsearch = true
set.showmatch = true

-- Buffers
-- Move between buffers without saving
set.hidden = true

-- Syntax
vim.syntax = "on"
vim.filetype.plugin = true
vim.filetype.indent = true

-- Disable swapfile and backups
vim.opt.swapfile = false
vim.opt.backup = false
