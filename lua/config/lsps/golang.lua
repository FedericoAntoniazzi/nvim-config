local go = {}

function go.setup(on_attach, capabilities, flags)
  require('go').setup({
    lsp_cfg = {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = flags
    },
    luasnip = true,
  })

  -- Auto format file on save
  local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
      require('go.format').goimport()
    end,
    group = format_sync_grp
  })
end

return go
