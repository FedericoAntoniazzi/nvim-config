local function get_yaml_schema()
  local schema = require("yaml-companion").get_buf_schema(0)
  if schema.result[1].name == "none" then
    return ""
  end
  return schema.result[1].name
end

require('lualine').setup({
  options = {
    theme = "catppuccin"
  },
  sections = {
    lualine_x = { "require'lsp-status'.status()", get_yaml_schema, 'filetype' },
  }
})
