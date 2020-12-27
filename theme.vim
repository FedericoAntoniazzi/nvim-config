" General
set background = "dark"
set termguicolors

" 
" TokyoNight
"
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 0
let g:tokyonight_disable_italic_comment = 1 " Disable italic in comments
let g:tokyonight_transparent_background = 1 " 1: Enabled, 0: Disabled
let g:tokyonight_menu_selection_background = 'green' " Available: green, red, blue
let g:tokyonight_cursor = 'blue' " Available auto, red, green, blue
let g:tokyonight_current_word = 'bold' " Current word highlighthing, Available: bold, underline, italiac, grey background

colorscheme tokyonight

"
" Airline
"
" Many comments are options I've noted just in case I wanna try different
" settings.
" See https://github.com/vim-airline/vim-airline
let g:airline_theme = "tokyonight" " Enable airline support

let g:airline#extensions#tabline#enabled = 1 " Display all buffers
let g:airline#extensions#tabline#formatter = 'default' " Available: default, unique_tail, unique_tail_improved
" let g:airline#extensions#tabline#fnamemod = ':t' " Show just the name
let g:airline_powerline_fonts = 1

