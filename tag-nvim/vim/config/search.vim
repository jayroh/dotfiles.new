" Stolen from mr. Gordon Fontenot almost entirely:
" https://github.com/gfontenot/dotfiles/blob/master/tag-vim/vim/config/search.vim

set gdefault                      " default to global substitutions on lines
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set hlsearch                      " Highlight matches.
set showmatch                     " Show all matches
autocmd BufReadCmd set nohlsearch " on opening the file, clear search-highlighting

" Use Ag over Grep
set grepprg=ag\ --nogroup\ --nocolor

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag -Q --files-with-matches --hidden --nocolor -g "" %s'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" Map Gr directly to \ for speeeed
nnoremap \ :Ag<SPACE>

" bind K to grep word under cursor
nnoremap K :Ag <C-R><C-W><CR>
