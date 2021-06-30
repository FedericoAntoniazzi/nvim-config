"
" System
"

set shell=/bin/zsh

" Use system clipboard
set clipboard=unnamedplus

"
" Styling
"
" Highlight current line
set cursorline

" Enable numbers
set number

" Hide the double -- INSERT -- when using Airline
set noshowmode

" Save on :make
set autowrite

" Do not wrap lines
set nowrap

" Display relative row numbers
set relativenumber

" Set window title
"set title

"
" Indentation
"
set autoindent
set noexpandtab
set tabstop=4 
set shiftwidth=4
set smarttab

" Set indentation level. Do NOT remove trailing space
set list lcs=tab:\|\ 

" Folding method based on syntax
set foldmethod=syntax
set foldlevelstart=0

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
nnoremap <A-h> <C-w><
nnoremap <A-l> <C-w>>
nnoremap <A-j> <C-w>+
nnoremap <A-k> <C-w>-
"
" Terminal
"
" Use ESC for exiting terminal mode and allow moving to other splits
tnoremap <Esc> <C-\><C-n>
nnoremap <Leader>t :30split <Bar> :terminal<CR>
nnoremap <Leader>vt :vert 50split <Bar> :terminal<CR>

"
" Buffers (because are better than tabs)
"
" Allow moving to another buffer without saving the actual one
set hidden
" Open a new empty buffer
nmap <leader>b :enew<CR>
" Move to next/previous buffer
nmap <leader>l :bnext<CR>
nmap <leader>h :bprev<CR>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bs :ls<CR>

"
" NerdTree
"
let NERDTreeMapCustomOpen = 'l'
let NERDTreeMapCloseDir = 'h'

" This is needed in order to avoid errors
let g:NERDTreeExtensionHighlightColor = {}
" Color the golang icon with the color used for the gopher icon
let s:golang_blue = "1f6f7d"
let g:NERDTreeExtensionHighlightColor['go'] = s:golang_blue

nnoremap <leader>m :NERDTreeToggle<CR>

augroup NerdTreeSettings
	" Start NERDTree and put the cursor back in the other window.
	autocmd VimEnter * NERDTree | wincmd p
	"
	" Start NERDTree when Vim is started without file arguments.
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

	" Start NERDTree when Vim starts with a directory argument.
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
		\ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

	" Exit Vim if NERDTree is the only window left.
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END

"
" Development
"
" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
nmap <C-n> :cnext<CR>
nmap <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

"
" Golang
"
" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

let g:go_fmt_autosave = 0
let g:go_gopls_complete_unimported = 'gopls'

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

augroup Golang
	" Organize imports on save
	autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
	" Run all tests
	autocmd BufEnter *.go nmap <leader>t <Plug>(go-test)
	" Run current test only
	autocmd BufEnter *.go nmap <leader>tt <Plug>(go-test-func)
	" Toggle the coverage profile for the current file
	autocmd BufEnter *.go nmap <leader>co <Plug>(go-coverage-toggle)
	" Info about func/type/var under the cursor
	autocmd BufEnter *.go nmap <leader>i <Plug>(go-info)
	" Info about implementations
	autocmd BufEnter *.go nmap <leader>ii <Plug>(go-implements)
	" Describe the func/type/var under the cursor
	autocmd BufEnter *.go nmap <leader>ci <Plug>(go-describe)
	autocmd BufEnter *.go nmap <leader>cc <Plug>(go-callers)
augroup END

"
" Markdown
"
let g:mkdp_browser = 'firefox'
let g:mkdp_filetypes = ['markdown']

"
" Terraform
"
let g:terraform_align = 1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1
augroup Terraform
	autocmd BufRead,BufNewFile *.hcl set filetype=terraform
augroup END

"
" Toml
" 
augroup Toml
	autocmd FileType toml set expandtab
augroup END

"
" Git Gutter
"
" Disable GitGutter mappings since I need only a reference
" of added, modified, deleted lines in files
let g:gitgutter_map_keys = 0
