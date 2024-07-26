return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {}
      },
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim"
      }
    },

    config = function()
      local lsps = {
        'ansiblels',
        'bashls',
        'dockerls',
        'golangci_lint_ls',
        'gopls',
        'jsonls',
        'ruff',
        'terraformls',
        'yamlls'
      }


      require("mason-tool-installer").setup({
        ensure_installed = lsps
      })
    end
  },
}
