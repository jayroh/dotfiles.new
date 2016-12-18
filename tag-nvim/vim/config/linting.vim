let g:neomake_javascript_enabled_makers = ['standard']
autocmd BufWritePost *.js,*.es6 silent !standard-format -w %
autocmd! BufReadPost,BufWritePost * Neomake
