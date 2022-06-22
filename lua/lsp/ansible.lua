local ansible = {}

function ansible.setup(on_attach, capabilities)
  require('lspconfig').ansiblels.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
      "yaml.ansible"
    },
    single_file_support = true
  }
end

return ansible
