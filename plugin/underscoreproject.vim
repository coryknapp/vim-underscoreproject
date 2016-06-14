if exists('g:loaded_underscoreproject') || v:version < 700|| &cp
"  finish
endif
let g:loaded_underscoreproject = 1

" calling  expand('<sfile>') gives the name of the enclosing function, so we
" have to do it in advance
let s:script_path = expand('<sfile>:p:h').'/underscoreproject.py'

function! SourceUnderscoreProjectFile()
	let s:output = system('python '.s:script_path.' '.expand('%:p'))
	if(len(s:output)>0)
		execute 'source '.s:output[:-1]
	endif
endfunction

augroup underscoreprojectgroup
    autocmd!
	autocmd BufNewFile,BufRead * :call SourceUnderscoreProjectFile()
augroup END
