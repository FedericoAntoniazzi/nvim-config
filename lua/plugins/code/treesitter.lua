return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { 'bash', 'dockerfile', 'go', 'gomod', 'json', 'hcl', 'python', 'vimdoc', 'yaml' },
      })
    end
  }
}
