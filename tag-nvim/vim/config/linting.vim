" let g:neomake_javascript_enabled_makers = ['standard']
autocmd BufWritePost *.js,*.es6 silent !standard-format -w %

set updatetime=1000
autocmd BufReadPost,BufWritePost * call ale#Lint()
autocmd CursorHold * call ale#Lint()
autocmd CursorHoldI * call ale#Lint()
autocmd InsertEnter * call ale#Lint()
autocmd InsertLeave * call ale#Lint()

let g:ale_lint_on_text_changed = 0
"let g:ale_linters = {
"  \   'javascript': ['eslint'],
"  \   'scss': ['scss-lint'] }

nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>
