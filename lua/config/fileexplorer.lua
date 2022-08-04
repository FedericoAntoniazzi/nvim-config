local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)

require('nvim-tree').setup({
	open_on_setup = true,
	sync_root_with_cwd = true,
	hijack_cursor = true,
	view = {
		adaptive_size = true,
	}
})
