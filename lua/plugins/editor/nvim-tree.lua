local function open_nvim_tree(data)
  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1
  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if (not real_file and not no_name) or (not directory) then
    return
  end
  -- open the tree, find the file but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end

return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "^1.5.0",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require('nvim-tree').setup({
        -- Keeps the cursor on the first letter of the filename when moving in the tree.
        hijack_cursor = true,
        -- Hijack netrw windows
        hijack_netrw = true,
        -- Show additional info
        view = {
          number = true,
          relativenumber = true,
          adaptive_size = true
        },
        -- Hide .git folder
        filters = {
          custom = { "^.git$" }
        }
      })

      vim.api.nvim_create_autocmd("VimEnter", { callback = open_nvim_tree })
      vim.api.nvim_create_autocmd("QuitPre", {
        callback = function ()
          vim.cmd("NvimTreeClose")
        end
      })
      vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" })
    end
  }
}
