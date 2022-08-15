local utils = require('utils')

local map = utils.map

-- Clear search results highlight
map("n", "<Space>", ":nohlsearch<CR>")

-- Move current buffer
map('n', ']b', '<cmd> BufferLineMoveNext<CR>')
map('n', '[b', '<cmd> BufferLineMovePrev<CR>')
-- Move to previous/next buffer
map('n', '<A-n>', '<cmd> BufferLineCyclePrev<CR>')
map('n', '<A-m>', '<cmd> BufferLineCycleNext<CR>')
-- Close buffer
map('n', '<A-q>', '<cmd> bp <bar> bd #<CR>')

-- Toggle file explorer
map('n', '<C-n>', ':NvimTreeToggle<CR>')

-- Navigate through errors
map('n', '<leader>p', '<cmd>:cprevious<CR>')
map('n', '<leader>n', '<cmd>:cnext<CR>')
map('n', '<leader>c', '<cmd>:cclose<CR>')
