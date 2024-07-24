local python = {}

function python.setup(on_attach, capabilities)
  require('lspconfig').pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,

    settings = {
      pylsp = {
        configurationSources = { "flake8" },
        plugins = {
          black = {
            enabled = true,
            line_length = 120
          },
          mccabe = {
            enabled = true
          },
          flake8 = {
            enabled = true,
            config = ".flake8",
            maxLineLength = 120,
            indentSize = 4
          },
          pycodestyle = {
            enabled = false
          },
        }
      }
    }
  }
end

return python
