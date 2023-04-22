local Yaml = {}

function Yaml.setup(on_attach, capabilities, flags)
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls
  require('lspconfig').yamlls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = flags,

    settings = {
      yaml = {
        schemas = {
          -- GitLab
          ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.{yaml,yml}",

          -- GitHub
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",

          -- Ansible
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible.json#/$defs/tasks"] = "*/tasks/*",
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-vars.json"] = "/(defaults|vars)/*",
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-meta.json"] = "/meta/meta.y{a,}ml",
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-meta-runtime.json"] = "/meta/runtime.y{a,}ml",
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-inventory.json"] = "/inventory/**/*.y{a,}ml",

          -- Kustomize
          ["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml",

          -- Docker compose
          ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.y{a,}ml"
        }
      }
    }
  }
end

return Yaml
