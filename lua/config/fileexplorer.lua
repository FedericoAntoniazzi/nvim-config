require('nvim-tree').setup({
  sync_root_with_cwd = true,
  -- Keeps the cursor on the first letter of the filename when moving in the tree.
  hijack_cursor = true,
  -- Hijack netrw windows
  hijack_netrw = true,
  view = {
    number = true,
    relativenumber = true,
    adaptive_size = true,
  }
})

-- Open nvim-tree at startup
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = require("nvim-tree.api").tree.open })
