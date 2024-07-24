return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      -- local protocol = require("vim.lsp.protocol")

      local on_attach = function(client, bufnr)
          -- format on save
          if client.server_capabilities.documentFormattingProvider then
              vim.api.nvim_create_autocmd("BufWritePre", {
                  group = vim.api.nvim_create_augroup("Format", { clear = true }),
                  buffer = bufnr,
                  callback = function()
                      vim.lsp.buf.format()
                  end,
              })
          end
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Use a loop to conveniently call 'setup' on multiple servers and
      -- map buffer local keybindings when the language server attaches
      local servers = { 'ansiblels', 'bashls', 'dockerls', 'gopls', 'golangci_lint_ls', 'terraformls' }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end
    end
  }
}