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

" Map Gr directly to \ for speeeed
nnoremap \ :Ag<SPACE>

" bind K to grep word under cursor
nnoremap K :Ag <C-R><C-W><CR>

" Find files using Telescope command-line sugar.
nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
