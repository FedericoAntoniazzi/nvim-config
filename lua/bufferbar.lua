require'bufferline'.setup {
  options = {
    -- Show buffer numbers
    numbers = function(opts)
      return string.format('%s', opts.ordinal)
    end,

    -- Command to use for closing buffers
    close_command = "bdelete! %d",

    -- Trunc markers
    left_trunc_marker = '',
    right_trunc_marker = '',

    -- Disable mouse commands
    right_mouse_command = nil,
    left_mouse_command = nil,
    middle_mouse_command = nil,

    -- Diagnositcs provider
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
          or (e == "warning" and " " or "" )
        s = s .. n .. sym
      end
      return s
    end,

    -- Bufferline styling
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_tab_indicators = true,
    separator_style = "thin",
    enforce_regular_tabs = false,

    custom_areas = {
      right = function()
        local result = {}
        local error = vim.lsp.diagnostic.get_count(0, [[Error]])
        local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
        local info = vim.lsp.diagnostic.get_count(0, [[Information]])
        local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

        if error ~= 0 then
          table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
        end

        if warning ~= 0 then
          table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
        end

        if hint ~= 0 then
          table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
        end

        if info ~= 0 then
          table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
        end
        return result
      end,
    }
  }
}
