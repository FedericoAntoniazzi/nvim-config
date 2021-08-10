lua require('plugins')

let vimrc = stdpath('config').'/vimrc'
exe 'source '.vimrc

lua require('statusline')
lua require('bufferbar')
