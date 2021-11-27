" Stolen wholesale from Gabe Berke-Williams who stole it from christoomey,
" whose dotfiles you really should check out:
" https://github.com/christoomey/dotfiles

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

" Map 'ctrl-s' to save buffer
" for normal mode ...
map <C-S> :w<cr>
" for insert mode ...
imap <C-S> <Esc>:w<cr>i

" Add hyphen, `-`, to iskeyword (see `:help iskeyword` for more) so that the
" hyphen is not used as a word separator. For example, by default if we had a
" variable named `is-keyword` and the cursor was somewhere in "keyword",
" running `diw` would only delete "keyword", and not "is-keyword". By updating
" this setting all of "is-keyword" would be considered one word.
"
" This will help with autocomplete as well. Trying to auto complete "is" by
" default would do nothing, but now it will try to autocomplete "is-keyword".
" This is super helpful for when you are editing (S)CSS selectors.
set iskeyword+=-

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
silent! colorscheme jellybeans

" vim-textobj-rubyblock requires that the matchit.vim plugin is enabled.
runtime macros/matchit.vim

highlight Comment cterm=italic gui=italic

" config ruby host
let g:ruby_host_prog = '~/.asdf/installs/ruby/3.0.2/bin/neovim-ruby-host'

" snippet location
let g:vsnip_snippet_dir = '~/.dotfiles/tag-nvim/snippets'

" disable automatic folding
set nofoldenable

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
}
EOF
