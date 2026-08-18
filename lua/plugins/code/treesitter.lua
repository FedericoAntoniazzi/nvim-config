return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    branch = "master",
    lazy = false,
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          'bash',
          'caddy',
          'dockerfile',
          'go',
          'gomod',
          'gosum',
          'json',
          'hcl',
          'python',
          'vimdoc',
          'yaml',
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  }
}
