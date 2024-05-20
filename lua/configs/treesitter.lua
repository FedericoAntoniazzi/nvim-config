require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'arduino',
    'bash',
    'comment',
    'csv',
    'dockerfile',
    'go',
    'gomod',
    'gotmpl',
    'hcl',
    'json',
    'lua',
    'python',
    'terraform',
    'yaml',
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Require tree-sitter cli
  auto_install = true,

  modules = {},

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

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
