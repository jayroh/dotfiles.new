" Stolen wholesale from Gabe Berke-Williams who stole it from christoomey,
" whose dotfiles you really should check out:
" https://github.com/christoomey/dotfiles
"
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*.vim'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

function! s:LoadPlugins()
  call plug#begin('~/.vim/bundle')
  source ~/.vim/plugins.vim
  call s:SourceConfigFilesIn('plugins')
  call plug#end()
endfunction

" Leader is ','
" <Leader> must be set before `s:SourceConfigFilesIn` below
" because leader is used at the moment mappings are defined.
" Changing mapleader after a mapping is defined has no effect on the mapping.
let mapleader=","

" toggle pasting with the F6 key
set pastetoggle=<F6>

call s:LoadPlugins()
call s:SourceConfigFilesIn('')
call s:SourceConfigFilesIn('config')
call s:SourceConfigFilesIn('functions')

" vim-plug loads all the filetype, syntax and colorscheme files, so turn them on
" _after_ loading plugins.
filetype plugin indent on
syntax enable
colorscheme jellybeans
