local Yaml = {}

function Yaml.setup(on_attach, capabilities, flags)

  local mergeSchemas = function (t1, t2)
    for k,v in pairs(t2) do
      t1[k] = v
    end
    return t1
  end

  local generateKubeSchemas = function ()
    local schemas = {}
    local minVersion = 15
    local maxVersion = 28
    for v = minVersion, maxVersion, 1 do
      table.insert(schemas, {
        name = string.format("Kubernetes v1.%d", v),
        uri = string.format("https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.%d-standalone-strict/all.json", v)
      })
    end

    return schemas
  end

  local schemas = generateKubeSchemas()
  schemas = mergeSchemas(schemas, {
    {
      name = "Fury KFD Distribution",
      uri = "https://raw.githubusercontent.com/sighupio/fury-distribution/main/schemas/public/kfddistribution-kfd-v1alpha2.json",
    },
    {
      name = "Fury KFD EKS",
      uri = "https://raw.githubusercontent.com/sighupio/fury-distribution/main/schemas/public/ekscluster-kfd-v1alpha2.json",
    },
  })

  local cfg = require("yaml-companion").setup({
    schemas = schemas,

    lspconfig = {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = flags,

      settings = {
        schemas = {
          -- GitLab CI
          ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.{yaml,yml}",

          -- GitHub Actions
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",

          -- Ansible
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible.json#/$defs/tasks"] = "*/tasks/*",
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-vars.json"] = "/(defaults|vars)/*",
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-meta.json"] = "/meta/meta.y{a,}ml",
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-meta-runtime.json"] = "/meta/runtime.y{a,}ml",
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-inventory.json"] = "/inventory/**/*.y{a,}ml",

          -- Docker compose
          ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "{docker-,}compose.y{a,}ml",

          -- Kubernetes
          -- By default, use the upstream
          ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json"] = "*.yaml"
        }
      }
    }
  })
  require("lspconfig")["yamlls"].setup(cfg)
end

return Yaml
