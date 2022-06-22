-- Ref: https://github.com/kyazdani42/nvim-tree.lua

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)

require 'nvim-tree'.setup {
  open_on_setup = true,
  update_cwd = true,
  renderer = {
    special_files = {
      "Makefile", "README.md",
      "Pipfile", "Pipfile.lock",
      "package.json", "package-lock.json",
      "go.mod", "go.sum"
    }
  }
}
