" Map <leader>sv to reload the main neovim config file
nnoremap <leader>rl :source ~/.config/nvim/init.vim<cr>

" Map <leader><leader> to switch to previous file
nnoremap <leader><leader> <c-^>

" Set <leader>c to clear search highlighting
nnoremap <leader>nh :nohlsearch<cr>

" Run ctags
nnoremap <leader>ct :!ctags -R .

" Open Neotree
nnoremap <leader>nt :Neotree toggle<cr>
