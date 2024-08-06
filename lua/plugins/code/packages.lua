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
      local join = function(t1, t2)
        for k, v in pairs(t2) do
          t1[k] = v
        end
        return t1
      end

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

      local linters = {
        'yamllint'
      }

      local formatters = {
        'yamlfix',
        'yamlfmt'
      }

      require("mason-tool-installer").setup({
        ensure_installed = join(lsps, join(linters, formatters))
      })
    end
  },
}
