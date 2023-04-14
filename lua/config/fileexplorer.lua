require('nvim-tree').setup({
  sync_root_with_cwd = true,
  hijack_cursor = true,
  view = {
    adaptive_size = true,
  }
})

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = require("nvim-tree.api").tree.open })
