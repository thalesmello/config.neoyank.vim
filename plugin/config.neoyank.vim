if exists('g:loaded_config_neoyank')
	finish
endif

let g:loaded_config_neoyank = 1

nnoremap gp :<c-u>Unite history/yank -default-action=append<CR>
nnoremap gP :<c-u>Unite history/yank<CR>
vnoremap gp :<c-u>Unite history/yank -default-action=replace<cr>

let replace_action = {}
function! replace_action.func(candidate)
	let word = a:candidate.word
	execute "normal! gv\"=word\<cr>p"
endfunction
call unite#custom#action('source/history/yank/*', 'replace', replace_action)
unlet replace_action

