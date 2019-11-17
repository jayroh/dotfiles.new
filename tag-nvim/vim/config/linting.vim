let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_info = 'ℹ'

hi link ALEErrorSign    Error
hi link ALEWarningSign  Warning

let g:ale_linters = {
\  'javascript': ['eslint'],
\  'ruby': ['rubocop'],
\  'markdown': ['languagetool'],
\  'gitcommit': ['languagetool'],
\}

let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'ruby': ['rubocop'],
\}

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Disable ALE auto highlights
let g:ale_set_highlights = 0

" ,aj to jump to next ale error
nmap <silent> <leader>aj :ALENext<cr>

" ,ak to jump back to previous ale error
nmap <silent> <leader>ak :ALEPrevious<cr>

" ,fix to automatically fix ale errors/warnings
nmap <silent> <leader>fix :ALEFix<cr>

" run rubocop against this file. Moved from vim tmux runner config
nmap <silent> <leader>bo :ALEFix<cr>
