vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  documentation = true;

  source = {
    path = true;
    buffer = true;
    luasnip = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = false;
    vsnip = false;
    ultisnips = false;
  };
}
