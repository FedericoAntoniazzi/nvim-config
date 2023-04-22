require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '-' },
  },
  current_line_blame = true,
  yadm = {
    enable = true
  }
}
