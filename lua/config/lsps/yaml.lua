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
          ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.{yaml,yml}"
        }
      }
    }
  }
end

return Yaml
