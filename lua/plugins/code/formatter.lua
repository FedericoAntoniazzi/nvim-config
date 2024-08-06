return {
  {
    'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          yaml = { "yamlfmt", "yamlfix" }
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        }
      })
    end
  }
}
