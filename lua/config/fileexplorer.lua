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

-- Open for directories and [No Name] buffers
local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if not directory and not no_name then
    return
  end

  -- open the tree, find the file but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end

-- Open nvim-tree at startup
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
