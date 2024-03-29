local utils = require('utils')

utils.create_augroup('Lua', {
  { 'Filetype', 'lua', 'set tabstop=2 expandtab shiftwidth=2 softtabstop=2' }
})

utils.create_augroup('Golang', {
  { 'Filetype go', 'nmap', '<leader>rr', '<cmd>:GoRun<CR>' },
  { 'Filetype go', 'nmap', '<leader>t', '<cmd>:GoTest<CR>' },
  { 'Filetype go', 'nmap', '<leader>b', '<cmd>:GoBuild<CR>' }
})

utils.create_augroup('HCL', {
  -- Manually set hcl filetype on .nomad files
  { 'BufEnter,BufNew', '*.nomad', 'set filetype=hcl' },
  { 'Filetype', 'hcl', 'set tabstop=2 expandtab shiftwidth=2 softtabstop=2' }
})

utils.create_augroup('Terraform', {
  { 'Filetype', 'terraform', 'set tabstop=2 expandtab shiftwidth=2 softtabstop=2' }
})
