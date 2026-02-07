return {
  {
    'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = 'n',
        desc = '[F]ormat buffer',
      },
    },
    config = function()
      require('conform').setup({
        formatters = {
          caddy = {
            command = 'caddy',
            args = {'fmt', '-'},
            stdin = true,
          },
        },
        formatters_by_ft = {
          caddy = { 'caddy' },
          yaml = { "yamlfmt", "yamlfix" },
          go = {}
        },
        -- format_on_save = {
        --   timeout_ms = 500,
        --   lsp_fallback = true,
        -- }
      })

      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, lsp_format = "fallback", range = range })
      end, { range = true })
    end
  }
}
