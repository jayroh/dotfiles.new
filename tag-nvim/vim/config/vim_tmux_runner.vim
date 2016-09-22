nmap <silent> <leader>rf  :VtrFocusRunner<cr>
nmap <silent> <leader>ro  :VtrOpenRunner<cr>
nmap <silent> <leader>rx  :VtrKillRunner<cr>
nmap <silent> <leader>rv  :VtrSendLinesToRunner<cr>
nmap <silent> <leader>rd  :VtrSendCtrlD<cr>
nmap <silent> <leader>rcl :VtrClearRunner<cr>

" send `exit` to pane
nmap <silent> <leader>ex  :VtrSendCommandToRunner exit<cr>:VtrKillRunner<cr>

" send `q` to pane
nmap <silent> <leader>q   :VtrSendCommandToRunner q<cr>:VtrKillRunner<cr>

" run test suite in the pane
nmap <silent> <leader>ta  :VtrOpenRunner<cr>:VtrSendCommandToRunner be rake<cr>
