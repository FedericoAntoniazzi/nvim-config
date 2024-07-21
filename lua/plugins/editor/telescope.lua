return {
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require("telescope").setup()

      -- set keymaps
      local km = vim.keymap
      km.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
      km.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
      km.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string in cwd" })
      km.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Find string under cursor in cwd" })
      km.set("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Find todos" })
      km.set("n", "<leader>fx", "<cmd>Telescope git_bcommits<cr>", { desc = "Find todos" })
    end
  }
}
