return {
  -- Quick text search
  {
    'nvim-telescope/telescope.nvim',
    version = "v0.1.6",
    event = {"VeryLazy"},
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      {"<leader>ff", ":lua require('telescope.builtin').find_files()<CR>", desc="Find files", mode="n", silent=true, noremap=true},
      {"<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>", desc="Grep files", mode="n", silent=true, noremap=true},
      {"<leader>fb", ":lua require('telescope.builtin').buffers()<CR>", desc="Show buffers", mode="n", silent=true, noremap=true},
      {"<leader>ft", ":lua require('telescope.builtin').treesitter()<CR>", desc="List function names and variables", mode="n", silent=true, noremap=true},
      {"<leader>fc", ":lua require('telescope.builtin').git_commits()<CR>", desc="Lists git commits with diff preview", mode="n", silent=true, noremap=true},
    },
  },
  -- Auto pair parenthesis and brackets
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require('configs.autopairs')
    end
  },
}
