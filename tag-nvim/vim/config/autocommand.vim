if has('autocmd')
  filetype indent plugin on

  augroup autoindent
    au!
    autocmd BufWritePre *.css,*.scss,*.sass :normal migg=G`i
  augroup End

  augroup myfiletypes
    au FileType gitcommit setlocal spell
    au FileType html,ruby,eruby,yaml,vim,javascript,json,scss,liquid,typescript,crystal,css
          \ setlocal autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab

    au BufRead,BufNewFile *.es6,*.js set ft=javascript
    au BufRead,BufNewFile *.sh set ft=sh
    au BufRead,BufNewFile *.html.erb set ft=html.eruby
    au BufRead,BufNewFile *.liquid set ft=html.liquid
    au BufRead,BufNewFile *etc/nginx/* set ft=nginx
    au BufRead,BufNewFile *.cr set ft=crystal

    au BufRead,BufNewFile *.json.jbuilder, set ft=ruby
    au BufRead,BufNewFile *.rabl set ft=ruby
    au BufRead,BufNewFile *.ru set ft=ruby
    au BufRead,BufNewFile *.step, set ft=ruby
    au BufRead,BufNewFile Capfile set ft=ruby
    au BufRead,BufNewFile Gemfile set ft=ruby
    au BufRead,BufNewFile Gemfile set ft=ruby
    au BufRead,BufNewFile Thorfile set ft=ruby

    " Markdown-like buffers
    au BufRead,BufNewFile *.md,*.markdown set ft=markdown
    au BufRead,BufNewFile *.md,*.markdown setlocal spell
    " Ctrl-q will add a markdown "H1" underline
    au BufRead,BufNewFile gitcommit,*.md,*.markdown nnoremap <leader>= yypv$r=
    au BufRead,BufNewFile gitcommit,*.md,*.markdown nnoremap <leader>- yypv$r-
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
