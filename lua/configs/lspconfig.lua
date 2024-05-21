local lspconfig = require('lspconfig')
local nvimcmp = require('cmp_nvim_lsp')

local capabilities = nvimcmp.default_capabilities()
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local bufopts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)

  vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
      vim.lsp.buf.format { async = false }
    end,
  })
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'ansiblels', 'bashls', 'dockerls', 'gopls', 'golangci_lint_ls', 'terraformls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

require('configs.lsps.lua').setup(on_attach, capabilities)
