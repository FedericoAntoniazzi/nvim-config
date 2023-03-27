local set = vim.opt

vim.g.mapleader = "\\"

-- Highlight current line
set.cursorline = true

set.list = true
set.listchars = {
  tab = "| "
}


-- System
set.shell = "/bin/zsh"
set.clipboard = "unnamedplus"

-- General
set.number = true
set.relativenumber = true
set.wrap = false

-- Indentation
set.autoindent = true
set.smartindent = true
set.expandtab = false
set.tabstop = 4
set.shiftwidth = 4
set.smarttab = true

-- Search
set.ignorecase = true
set.smartcase = true
set.incsearch = true
set.showmatch = true

-- Buffers
-- Allow moving from one buffer to another without saving
set.hidden = true

-- Syntax
vim.syntax = "on"
vim.filetype.plugin = true
vim.filetype.indent = true
