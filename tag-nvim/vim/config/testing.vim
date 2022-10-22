" make test commands execute using Vim Tmux Runner[1]
let test#strategy = "vtr"
"[1]: https://github.com/christoomey/vim-tmux-runner

" Turn off usage of binstubs. Force it to use bundle exec.
let test#ruby#use_binstubs = 0

nmap <silent> <leader>f :VtrSendCommandToRunner bundle exec rspec --only-failures<cr>  " run the last failures
nmap <silent> <leader>t :TestFile<cr>    " run tests in current file/buffer
nmap <silent> <leader>l :TestLast<cr>    " repeat last test command
nmap <silent> <leader>s :TestNearest<cr> " run the test closes to the cursor
nmap <silent> <leader>to :TestVisit<cr>  " open the last test file in the buffer
