Plug 'nanotech/jellybeans.vim'

" Language-specific plugins

" Golang
Plug 'fatih/vim-go'

" Ansible
Plug 'chase/vim-ansible-yaml'

" Ruby/Rails
Plug 'tpope/vim-rails'
Plug 'kana/vim-textobj-user'          " is a dependency of ...
Plug 'nelstrom/vim-textobj-rubyblock' " ... this.

" Plumbing to make everything nicer
" ---------------------------------

" :Ag is like :grep but with `ag`
Plug 'rking/ag.vim'

" Easily comment/uncomment lines in many languages
Plug 'tomtom/tcomment_vim'

" Git bindings
Plug 'tpope/vim-fugitive'

" Auto-add `end` in Ruby, `endfunction` in Vim, etc
Plug 'tpope/vim-endwise'

" Fuzzy-finder
Plug 'ctrlpvim/ctrlp.vim'

" Trim trailing whitespace on write
Plug 'derekprior/vim-trimmer'

" When editing deeply/nested/file, auto-create deeply/nested/ dirs
Plug 'duggiefresh/vim-easydir'

" Cool statusbar
Plug 'itchyny/lightline.vim'

" Easily navigate directories
Plug 'tpope/vim-vinegar'

" Make working with shell scripts nicer ("vim-unix")
Plug 'tpope/vim-eunuch'

" Surround selected text intelligently
Plug 'tpope/vim-surround'

" Make `.` work to repeat plugin actions too
Plug 'tpope/vim-repeat'

" Intelligently reopen files where you left off
Plug 'dietsche/vim-lastplace'

" Buffer management made easy(-ier)
Plug 'troydm/easybuffer.vim'

" Neomake fullfills the same job Syntastic had previously, except it's async
Plug 'benekastah/neomake'

" Ability to define and utilize snippets of text or code
Plug 'SirVer/ultisnips'

" <Tab> indents or triggers autocomplete, smartly
Plug 'ervandew/supertab'

" Deoplete is an on the fly auto complete for your local buffer
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Deoplete sources for ruby. (provides the core Ruby methods)
Plug 'fishbullet/deoplete-ruby'

" Automatically match any brackets, parentheses or quotes when you’re typing
Plug 'Raimondi/delimitMate'

" A Vim wrapper for running tests on different granularities.
Plug 'janko-m/vim-test'

" Vim and Tmux sitting in a tree ...
" ----------------------------------

" To navigate with ctrl+h/j/k/l across tmux and vim windows
Plug 'christoomey/vim-tmux-navigator'

" Make vim and tmux work together with some crazy voodoo sorcery
Plug 'christoomey/vim-tmux-runner'
