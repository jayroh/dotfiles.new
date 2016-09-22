if has('autocmd')
  filetype indent plugin on

  augroup myfiletypes
    au FileType html,ruby,eruby,yaml,rubymotion,vim,javascript
          \ setlocal autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab

    au BufRead,BufNewFile *.md,*.markdown set ft=markdown
    au BufRead,BufNewFile *.sh set ft=sh
    au BufRead,BufNewFile *.html.erb set ft=html.eruby
    au BufRead,BufNewFile *etc/nginx/* set ft=nginx

    au BufRead,BufNewFile *.json.jbuilder, set ft=ruby
    au BufRead,BufNewFile *.rabl set ft=ruby
    au BufRead,BufNewFile *.ru set ft=ruby
    au BufRead,BufNewFile *.step, set ft=ruby
    au BufRead,BufNewFile Capfile set ft=ruby
    au BufRead,BufNewFile Gemfile set ft=ruby
    au BufRead,BufNewFile Gemfile set ft=ruby
    au BufRead,BufNewFile Thorfile set ft=ruby
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
