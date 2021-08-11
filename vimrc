let vimrcs = stdpath('config').'/vimrcs'

exe 'source '.vimrcs.'/system.vim'
exe 'source '.vimrcs.'/ui.vim'
exe 'source '.vimrcs.'/languages.vim'

augroup PackerNvim
	" Run PackerCompile after every edit at plugins.lua file
	autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup END
