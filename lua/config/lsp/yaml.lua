local Yaml = {}

local folderOfThisFile = (...):match("(.-)[^%.]+$")

function Yaml.setup(on_attach, capabilities)
  local schemas = require(folderOfThisFile .. "yaml_kubernetes_crds")
  local cfg = require("yaml-companion").setup({
    schemas = schemas,

    lspconfig = {
      on_attach = on_attach,
      capabilities = capabilities,

      settings = {
        schemas = {
          -- GitLab CI
          ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] =
          ".gitlab-ci.{yaml,yml}",

          -- GitHub Actions
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",

          -- Ansible
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible.json#/$defs/tasks"] = "*/tasks/*",
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-vars.json"] = "/(defaults|vars)/*",
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-meta.json"] = "/meta/meta.y{a,}ml",
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-meta-runtime.json"] =
          "/meta/runtime.y{a,}ml",
          ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-inventory.json"] =
          "/inventory/**/*.y{a,}ml",

          -- Docker compose
          ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
          "{docker-,}compose.y{a,}ml",

          -- Kubernetes
          -- By default, use the upstream
          ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json"] =
          "*.yaml"
        }
      }
    }
  })
  require("lspconfig")["yamlls"].setup(cfg)
end

return Yaml
