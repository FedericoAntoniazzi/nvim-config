call plug#begin("~/.config/nvim/plugins")

" Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'FedericoAntoniazzi/tokyonight-vim'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Completion and tools
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'

" Golang
Plug 'fatih/vim-go'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Rust/Cargo
Plug 'timonv/vim-cargo'

" Terraform
Plug 'hashivim/vim-terraform'

call plug#end()

source ~/.config/nvim/vimrc
source ~/.config/nvim/theme.vim
source ~/.config/nvim/coc-conf.vim

