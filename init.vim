lua require('plugins')
lua require('statusline')
lua require('bufferbar')
lua require('fileexplorer')
lua require('autocompletion')

let vimrc = stdpath('config').'/vimrc'
exe 'source '.vimrc

