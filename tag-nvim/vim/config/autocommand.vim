if has('autocmd')
  filetype indent plugin on

  augroup autoindent
    au!
    autocmd BufWritePre *.css,*.json :normal migg=G`i
  augroup End

  augroup myfiletypes
    au BufRead,BufNewFile *.yml,*.yaml,*.yml.j2 set ft=yaml
    au BufRead,BufNewFile *.es6,*.js set ft=javascript
    au BufRead,BufNewFile *.sh set ft=sh
    au BufRead,BufNewFile *.html.erb set ft=eruby
    au BufRead,BufNewFile *.liquid set ft=liquid
    au BufRead,BufNewFile *etc/nginx/* set ft=nginx
    au BufRead,BufNewFile *.cr set ft=crystal
    au BufRead,BufNewFile *.json.jbuilder, set ft=ruby
    au BufRead,BufNewFile *.rabl set ft=ruby
    au BufRead,BufNewFile *.ru set ft=ruby
    au BufRead,BufNewFile Capfile set ft=ruby
    au BufRead,BufNewFile Gemfile set ft=ruby
    au BufRead,BufNewFile Gemfile set ft=ruby
    au BufRead,BufNewFile Thorfile set ft=ruby
    au BufRead,BufNewFile compose.yaml,compose.yml,docker-compose.yaml,docker-compose.yml set ft=yaml.docker-compose

    au Filetype json let g:indentLine_enabled = 0
    au FileType gitcommit setlocal spell
    au FileType html,ruby,eruby,yaml,vim,javascript,json,liquid,typescript,crystal,css setlocal autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    au FileType html.eruby setlocal autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    au BufWritePre *.rb,*.rake,*.js,*.ts lua vim.lsp.buf.format(nil, 2000)
    au BufWritePost * lua require('lint').try_lint()

    " Markdown-like buffers
    au BufRead,BufNewFile *.md,*.markdown,gitcommit set ft=markdown
    au FileType *.md,*.markdown,gitcommit setlocal textwidth=100
    au BufNewFile,BufRead,BufNewFile,BufWrite *.md,*.markdown,gitcommit syntax match Comment /\%^---\_.\{-}---$/
    au BufRead,BufNewFile *.md,*.markdown,gitcommit setlocal spell

    " Ctrl-q will add a markdown "H1/H2" underline
    au BufRead,BufNewFile *.md,*.markdown,gitcommit nnoremap <leader>= yypv$r=
    au BufRead,BufNewFile *.md,*.markdown,gitcommit nnoremap <leader>- yypv$r-
  augroup END

  " set any files starting with the bash shebang as `sh` files
  au BufRead,BufNewFile,BufWrite *
        \ if getline(1) =~ "#!/bin/bash" |
        \   set ft=sh |
        \ endif

  " set any files starting with the zsh shebang as `zsh` files
  au BufRead,BufNewFile,BufWrite *
        \ if getline(1) =~ "#!/bin/zsh" |
        \   set ft=zsh |
        \ endif

else
  set autoindent
endif
