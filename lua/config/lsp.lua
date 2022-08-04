local lspconfig = require('lspconfig')
local nvim_cmp = require('cmp_nvim_lsp')

local on_attach = function(client, bufnr)
	local bufopts = { noremap=true, silent=true, buffer=bufnr }

	-- Mappings
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)

	-- Signature
	require('lsp_signature').on_attach({
		bind = true,
		doc_lines = 10,
		hint_enable = true,
		use_lspsaga = false,
		hint_prefix = "=> "
	})
end

local flags = {
	-- Default in NeoVim 0.7+
	debouce_text_changes = 150,
}

local capabilities = nvim_cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'bashls' }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = flags
	})
end

require('config.lsps.lua').setup(on_attach, capabilities, flags)
