command! Ctags call s:generate_ctags()

function! s:generate_ctags()
  call system("git ls-files | ctags -L -")
endfunction

nnoremap <silent> <leader>tv :let word=expand("<cword>")<CR>:vsp<CR>:exec("tag ". word)<cr>
