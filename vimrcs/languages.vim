filetype plugin on
filetype indent on

augroup Lua
	au Filetype lua
		\ set tabstop=2 |
		\ set expandtab |
		\ set shiftwidth=2 |
		\ set softtabstop=4
augroup END

augroup YamlJ2Template
	au BufRead,BufNewFile *.yml.j2,*.yaml.j2
		\ set tabstop=2 |
		\ set expandtab |
		\ set shiftwidth=2 |
		\ set softtabstop=4
augroup END

augroup HCL
	au BufRead,BufNewFile *.hcl
		\ set tabstop=2 |
		\ set expandtab |
		\ set shiftwidth=2 |
		\ set softtabstop=4
augroup END
