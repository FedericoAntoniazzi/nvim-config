-- Set leader
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Clear search results highlight
vim.keymap.set("n", "<Space>", ":nohlsearch<CR>")

-- Close buffer
vim.keymap.set('n', '<C-q>', '<cmd> bp <bar> bd #<CR>')

-- Reload configuration
local function reload()
  dofile(vim.env.MYVIMRC)
  print("Configuration reloaded")
end
vim.keymap.set("n", "<leader>ve", ":tabnew $MYVIMRC<cr>", { desc = "Open neovim configuration file" })
vim.keymap.set("n", "<leader>vr", reload, { desc = "Re-source neovim configuration file" })
