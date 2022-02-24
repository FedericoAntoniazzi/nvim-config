local yaml = {}

function yaml.setup(on_attach, capabilities)
  require'lspconfig'.yamlls.setup{
    on_attach=on_attach,
    capabilities = capabilities,
    filetypes = {"yaml", "yaml.ansible", "yaml.docker-compose"},
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["https://json.schemastore.org/chart.json"] = "*/charts/*",
          kubernetes = "*/manifests/*"
        }
      }
    }
  }
end

return yaml
