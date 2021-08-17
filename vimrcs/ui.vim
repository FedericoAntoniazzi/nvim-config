"
" Theme
"
" Disable italic in keywords
let g:tokyonight_italic_keywords = 0
" Disable italic in comments
let g:tokyonight_italic_comments = 0
" Set transparent background
let g:tokyonight_transparent = 1
" Set a darker background on sidebar-like windows
let g:tokyonight_sidebars = [ "packer" ]
" Sidebar like windows like NvimTree get a transparent background
let g:tokyonight_transparent_sidebar = 1
" When true, section headers in the lualine theme will be bold
let g:tokyonight_lualine_bold = 0
" Override specific colors
"let g:tokyonight_colors = { 'comment': '#5f688e' }

set termguicolors
colorscheme tokyonight

"
" Styling
"
" Highlight current line
set cursorline
" Enable relative numbers
set number relativenumber
" Hide the double -- INSERT -- when using Airline
set noshowmode
" Save on :make
set autowrite
" Do not wrap lines
set nowrap
" Show indentation level. Do NOT remove trailing space
set list lcs=tab:\|\ 

highlight link CompeDocumentation NormalFloat
