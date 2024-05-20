require('gitsigns').setup({
  -- Use explicit signs instead of color only
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '-' },
  },
  -- Highlight number column
  numhl = true,

  -- Show blame for current line
  current_line_blame = true,

  -- Enable diffs in a yadm repository
  yadm = {enable = true},
})
