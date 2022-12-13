local python = {}

function python.setup(on_attach, capabilities, flags)
  require'lspconfig'.pylsp.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = flags,

    settings = {
      pylsp = {
        configurationSources = {"flake8"},
        plugins = {
          pycodestyle = {enabled = false},
          mccabe = {enabled = false},
          pyflakes = {enabled = false},
          flake8 = {
            enabled = true,
            config = ".flake8",
            maxLineLength = 120
          },
          black = {
            enabled = true,
            line_length = 120
          }
        }
      }
    }
  }
end

return python
