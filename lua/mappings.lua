local utils = require('utils')

local map = utils.map

-- Clear search results highlight
map("n", "<Space>", ":nohlsearch<CR>")

-- Close buffer
map('n', '<C-q>', '<cmd> bp <bar> bd #<CR>')

-- Navigate through errors
map('n', '<leader>p', '<cmd>:cprevious<CR>')
map('n', '<leader>n', '<cmd>:cnext<CR>')
map('n', '<leader>c', '<cmd>:cclose<CR>')

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
