require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'bash',
    'dockerfile',
    'go',
    'gomod',
    'javascript',
    'json',
    'hcl',
    'python',
    'rust',
    'typescript',
    'vim',
    'yaml'
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    disable = { 'yaml' },
    enable = true
  }
}
