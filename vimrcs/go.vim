augroup Go
	" Writes the content of the file automatically when calling :make
	set autowrite

	autocmd FileType go nmap <leader>b  <Plug>(go-build)
	autocmd FileType go nmap <leader>r  <Plug>(go-run)

	let g:go_list_type = "quickfix"

	" run :GoBuild or :GoTestCompile based on the go file
	function! s:build_go_files()
		let l:file = expand('%')
		if l:file =~# '^\f\+_test\.go$'
			call go#test#Test(0, 1)
		elseif l:file =~# '^\f\+\.go$'
			call go#cmd#Build(0)
		endif
	endfunction

	autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
augroup END
