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
" Move between splits
nnoremap <A-h> <C-W><C-H>
nnoremap <A-j> <C-W><C-J>
nnoremap <A-k> <C-W><C-K>
nnoremap <A-l> <C-W><C-L>
nnoremap <leader><Up> :exe "resize " . (winheight(0) +5)<CR>
nnoremap <leader><Down> :exe "resize " . (winheight(0) -5)<CR>
nnoremap <leader><Left> :exe "vertical resize " . (winheight(0) +5)<CR>
nnoremap <leader><Right> :exe "vertical resize " . (winheight(0) -5)<CR>

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
let g:go_fmt_experimental = 1
let g:go_fmt_autosave = 0
let g:go_gopls_complete_unimported = 'gopls'

augroup Golang
	autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
augroup END
"
" Markdown
"
let g:mkdp_browser = 'firefox'
let g:mkdp_filetypes = ['markdown']

"
" HTML/XML/XHTML/CSS (Emmet)
"
" Enable emmet only in Insert and Normal mode
let g:user_emmet_mode = 'in'

" Enable emmet just for html/css/php
let g:user_emmet_install_global = 0

" Tell Bracey which browser it has to open for live preview
g:bracey_browser_command = 'firefox'
" Refresh current page when buffer is written
g:bracey_refresh_on_save = 1

" Adjust indent size for html files
augroup WebDevelopment
	autocmd FileType html,css,js,ts set expandtab shiftwidth=2
	autocmd FileType html,css,php EmmetInstall
augroup END

"
" Terraform
"
let g:terraform_align = 1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1
augroup Terraform
	autocmd BufRead,BufNewFile *.hcl set filetype=terraform
augroup END
