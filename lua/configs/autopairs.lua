require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" },

  -- Don't add pairs if it already has a close pair in the same line
  enable_check_bracket_line = false,

  -- Don't add pairs if the next char is alphanumeric
  ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
})
