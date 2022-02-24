" Set which shell to use
set shell=/bin/zsh
" Use system clipboard
set clipboard=unnamedplus
set updatetime=1000

"
" Indentation
"
" These are default settings that will be overriden by
" specific settings for languages
set autoindent smartindent
set noexpandtab
set tabstop=4 shiftwidth=4
set smarttab

"
" Folding
"
" Folding method based on syntax
" set foldmethod=syntax
" set foldlevelstart=0
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

"
" Search
"
" Ignore case when searching
set ignorecase
set smartcase
" Highlight patterns while typing the pattern
set incsearch
" Show matching brackets
set showmatch

"
" Splits
"
" Resize splits
nnoremap <A-h> 5<C-w><
nnoremap <A-l> 5<C-w>>
nnoremap <A-j> 5<C-w>+
nnoremap <A-k> 5<C-w>-

"
" Terminal
"
" Open terminal in a new split
nnoremap <Leader>t :30split <Bar> :terminal<CR>
nnoremap <Leader>vt :vert 50split <Bar> :terminal<CR>
" Use ESC for exiting terminal mode and allow moving to other splits
tnoremap <Esc> <C-\><C-n>

"
" Buffers
"
" Because are better than tabs
" Allow moving to another buffer without saving the current one
set hidden
" Open a new empty buffer
nmap <leader>b :enew<CR>
" Move to next/previous buffer
nmap <A-m> :bnext<CR>
nmap <A-n> :bprev<CR>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <A-q> :bp <BAR> bd #<CR>
