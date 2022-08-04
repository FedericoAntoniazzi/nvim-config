local lua = {}

function lua.setup(on_attach, capabilities, flags)
  require('lspconfig').sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = flags,

    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        }
      }
    }
  }
end

return lua
