" make test commands execute using Vim Tmux Runner[1]
let test#strategy = "vtr"

" add support for the teapspoon js test runner
let test#runners = {'JavaScript': ['Teaspoon']}
let test#javascript#runner = 'teaspoon'

nmap <silent> <leader>f :VtrSendCommandToRunner bundle exec rspec --only-failures<cr>  " run the last failures
nmap <silent> <leader>t :TestFile<cr>    " run tests in current file/buffer
nmap <silent> <leader>l :TestLast<cr>    " repeat last test command
nmap <silent> <leader>s :TestNearest<cr> " run the test closes to the cursor
nmap <silent> <leader>to :TestVisit<cr>  " open the last test file in the buffer

"[1]: https://github.com/christoomey/vim-tmux-runner
