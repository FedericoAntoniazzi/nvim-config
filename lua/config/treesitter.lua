require('nvim-treesitter.install').update({
  with_sync = true
})

require('nvim-treesitter.configs').setup({
  ensure_installed = { 'bash', 'dockerfile', 'go', 'gomod', 'json', 'hcl', 'python', 'yaml' },

  -- Consistent syntax highlighting
  highlight = {
    enable = true,
  },

  -- Incremental selection based on the named nodes from the grammar
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },

    -- EXPERIMENTAL: Indentation based on treesitter for the = operator
    indent = {
      enable = true,
    },
  },
})

-- Use treesitter as folding engine
-- Workaround from https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})
