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
        -- Disable automatic formatting on go. Handled by go.nvim
        if vim.bo[bufnr].filetype == "go" then
          return
        end

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
      local servers = {
        'ansiblels',
        'basedpyright',
        'bashls',
        'dockerls',
        'golangci_lint_ls',
        'gopls',
        'jsonls',
        'ruff',
        'terraformls',
      }

      for _, lsp in ipairs(servers) do
        vim.lsp.config(lsp, {
          on_attach = on_attach,
          capabilities = capabilities,
        })
        vim.lsp.enable(lsp)
      end

      vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

      -- require('config.lsp.lua').setup(on_attach, capabilities)
      -- require('config.lsp.yaml').setup(on_attach, capabilities)
    end
  },
  {
    "someone-stole-my-name/yaml-companion.nvim",
    event = { "VeryLazy" },
    config = function()
      require("telescope").load_extension("yaml_schema")
    end
  }
}
