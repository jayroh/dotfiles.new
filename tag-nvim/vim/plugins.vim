Plug 'nanotech/jellybeans.vim'

" Language-specific plugins

" Golang
Plug 'fatih/vim-go'

" Ansible
Plug 'chase/vim-ansible-yaml'

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

" Automatically match any brackets, parentheses or quotes when you’re typing
Plug 'Raimondi/delimitMate'

" Vim and Tmux sitting in a tree ...
" ----------------------------------

Plug 'christoomey/vim-tmux-navigator'
