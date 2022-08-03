local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth', '1',
	'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd 'packadd packer.nvim'
end

-- Automatically compile changes when this file is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Catppuccin theme
	use {
		'catppuccin/nvim',
		as = 'catppuccin',
		config = function()
			require('config.theme')
		end
	}

	-- Status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons', opt = true
		},
		config = function()
			require('config.statusline')
		end
	}

	-- File explorer
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', opt = true
		},
		config = function()
			require('config.fileexplorer')
		end
	}

	-- Buffer bar
	use {
		'akinsho/bufferline.nvim',
		tag = "v2.*",
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('config.bufferbar')
		end
	}

	-- Git symbols
	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('config.gitsymbols')
		end
	}
end)
