call plug#begin("~/.config/nvim/plugins")

" Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'FedericoAntoniazzi/tokyonight-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'preservim/nerdtree'

" Completion and tools
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'

" Golang
Plug 'fatih/vim-go'
" (xh)tml
Plug 'othree/xml.vim'
Plug 'mattn/emmet-vim'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

source ~/.config/nvim/vimrc
source ~/.config/nvim/theme.vim
source ~/.config/nvim/coc-conf.vim

