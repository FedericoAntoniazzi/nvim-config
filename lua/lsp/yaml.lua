local yaml = {}

function yaml.setup(on_attach, capabilities)
  require 'lspconfig'.yamlls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "yaml", "yaml.ansible", "yaml.docker-compose" },
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["https://json.schemastore.org/chart.json"] = "*/charts/*",
          ["https://json.schemastore.org/kustomization.json"] = "kustomization(s|.yaml)",
          kubernetes = "*/manifests/*",

          -- Ansible
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible.json#/$defs/tasks"] = "*/tasks/*",
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-vars.json"] = "/(defaults|vars)/*",
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-requirements.json"] = "roles/**/requirements.txt"
        }
      }
    }
  }
end

return yaml
