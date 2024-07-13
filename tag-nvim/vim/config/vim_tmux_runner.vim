let g:VtrDetachedName = "detached"
let g:VtrPercentage = 30

nmap <silent> <leader>rf  :VtrFocusRunner<cr>
nmap <silent> <leader>ro  :VtrOpenRunner<cr>
nmap <silent> <leader>rx  :VtrKillRunner<cr>
nmap <silent> <leader>rc  :VtrKillRunner<cr>
nmap <silent> <leader>rd  :VtrSendCtrlD<cr>
nmap <silent> <leader>rcl :VtrClearRunner<cr>

" send `q` to pane
nmap <silent> <leader>q   :VtrSendCommandToRunner q<cr>:VtrKillRunner<cr>

" run test suite in the pane
nmap <silent> <leader>ta  :VtrOpenRunner<cr>:VtrSendCommandToRunner be rake<cr>

" repeat last command in the pane
nmap <silent> <leader>ll  :VtrSendCommandToRunner !!<cr><cr>

" send `bundle` to pane
nmap <silent> <leader>bun :VtrOpenRunner<cr>:VtrSendCommandToRunner bundle install<cr>

" display git status in pane
nmap <silent> <leader>gs :VtrOpenRunner<cr>:VtrSendCommandToRunner g s<cr>:VtrFocusRunner<cr>

" display git diff in pane
nmap <silent> <leader>gd :VtrOpenRunner<cr>:VtrSendCommandToRunner g diff<cr>:VtrFocusRunner<cr>

" run rails server using local .port file
nmap <silent> <leader>ser :VtrOpenRunner<cr>:VtrSendCommandToRunner rails server puma -p `cat .port`<cr>

" run rake
nmap <silent> <leader>bra :VtrOpenRunner<cr>:VtrSendCommandToRunner rake<cr>

" send lines to runner
vnoremap <silent> <leader>s :VtrSendLinesToRunner<cr>
