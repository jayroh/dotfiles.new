" Stolen from mr. Gordon Fontenot entirely:
" https://github.com/gfontenot/dotfiles/blob/master/tag-vim/vim/config/spellcheck.vim

set spellfile=~/.vim/spell/en.utf-8.add

augroup spellcheck
  autocmd!

  " recreate the spelling dictionary at startup
  autocmd VimEnter * execute "silent mkspell! " . &spellfile
augroup END
