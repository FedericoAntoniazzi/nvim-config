require('nvim-autopairs').setup{
  -- Don't add pairs if it already have a close pairs in same line
  enable_check_bracket_line = false,
  -- Don't add pairs if the next char is alphanumeric
  ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
}
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
