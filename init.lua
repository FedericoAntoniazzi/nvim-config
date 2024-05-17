require('settings')

local augrp = vim.api.nvim_create_augroup
local aucmd = vim.api.nvim_create_autocmd

local lua = augrp('lua', { clear = true })
aucmd({'FileType'}, {
  pattern = "lua",
  group = lua,
  command = 'set tabstop=2 expandtab shiftwidth=2 softtabstop=2',
})
