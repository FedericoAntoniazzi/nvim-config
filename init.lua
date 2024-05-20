require('settings')

local augrp = vim.api.nvim_create_augroup
local aucmd = vim.api.nvim_create_autocmd

local lua = augrp('lua', { clear = true })
aucmd({'FileType'}, {
  pattern = "lua",
  group = lua,
  command = 'set tabstop=2 expandtab shiftwidth=2 softtabstop=2',
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.cmd.colorscheme('catppuccin')
