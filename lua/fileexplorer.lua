-- Ref: https://github.com/kyazdani42/nvim-tree.lua
vim.g.nvim_tree_side = "left"
vim.g.nvim_tree_width = 30
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_disable_netrw = 1
vim.g.nvim_tree_hijack_netrw = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_group_empty = 1

vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git= {
    unstaged= "✗",
    staged= "✓",
    unmerged= "",
    renamed= "➜",
    untracked= "★",
    deleted= "",
    ignored= "◌"
  },
  lsp = {
    hint = "",
    info = "",
    warning = "",
    error = ""
  }
}
