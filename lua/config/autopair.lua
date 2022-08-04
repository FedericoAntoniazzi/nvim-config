local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

npairs.setup({
	disable_filetype = { "TelescopePrompt" },

	-- Don't add pairs if it already has a close pair in the same line
	enable_check_bracket_line = false,

	-- Don't add pairs if the next char is alphanumeric
	ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
})

-- Add parentheses when completing a function
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

-- Custom rules
-- Source: https://github.com/windwp/nvim-autopairs/wiki/Custom-rules

-- Add spaces between parentheses
npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
  Rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
  Rule('[ ', ' ]')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(']')
}
