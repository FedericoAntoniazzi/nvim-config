local Yaml = {}

local folderOfThisFile = (...):match("(.-)[^%.]+$")

local mergeSchemas = function(t1, t2)
  for k, v in pairs(t2) do
    t1[k] = v
  end
  return t1
end

local crds_path = os.getenv("HOME") .. "/.config/nvim/resources/k8scrds/"
-- Manually import CRD schemas
local schemas = {
  { name = "Fury KFD Distribution", uri = "https://raw.githubusercontent.com/sighupio/fury-distribution/main/schemas/public/kfddistribution-kfd-v1alpha2.json" },
  { name = "Fury KFD EKS",          uri = "https://raw.githubusercontent.com/sighupio/fury-distribution/main/schemas/public/ekscluster-kfd-v1alpha2.json" },
  { name = "Fury OnPremises",       uri = "https://raw.githubusercontent.com/sighupio/fury-distribution/main/schemas/public/onpremises-kfd-v1alpha2.json" },
}

-- function Yaml.setup(on_attach, capabilities)
function Yaml.setup(capabilities)
  local cfg = require("yaml-companion").setup({
    -- Load CRDs from a file
    schemas = mergeSchemas(require(folderOfThisFile .. "yaml_kubernetes_crds"), schemas),

    builtin_matchers = {
      kubernetes = { enabled = true },
    },

    lspconfig = {
      -- on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        yaml = {
          -- For debug purposes, set hardcoded schemas on given filenames
          schemas = {
            [crds_path .. "postgresql.cnpg.io/cluster_v1.json"] = "cluster.yaml",
            [crds_path .. "postgresql.cnpg.io/backup_v1.json"] = "backup.yaml",
            [crds_path .. "postgresql.cnpg.io/scheduledbackup_v1.json"] = "scheduledbackup.yaml",
            -- Kubernetes = "*.yaml"
            ["https://raw.githubusercontent.com/sighupio/fury-distribution/main/schemas/public/onpremises-kfd-v1alpha2.json"] =
            "furyctl.yaml"
          },
          schemaStore = {
            enable = true,
          }
        }
      }
    }
  })

  require("lspconfig").yamlls.setup(cfg)
end

return Yaml
