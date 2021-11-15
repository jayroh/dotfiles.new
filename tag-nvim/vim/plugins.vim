Plug 'nanotech/jellybeans.vim'

" Linting
Plug 'w0rp/ale', { 'do': 'yarn add eslint babel-eslint eslint-plugin-react' }

" Language-specific plugins

" Golang
Plug 'fatih/vim-go'

" Ansible
Plug 'chase/vim-ansible-yaml'

" Ruby/Rails
Plug 'tpope/vim-rails'
Plug 'kana/vim-textobj-user'          " is a dependency of ...
Plug 'nelstrom/vim-textobj-rubyblock' " ... this.
Plug 'ecomba/vim-ruby-refactoring'    " some ruby refactoring goodness

" HTML
Plug 'editorconfig/editorconfig-vim'

" JavaScript, ES6, Typescript, Vue, React
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'posva/vim-vue'
Plug 'mvolkmann/vim-js-arrow-function'

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'

" Plumbing to make everything nicer
" ---------------------------------

" Sort using text objects and motions
Plug 'christoomey/vim-sort-motion'

" Copy to system clipboard using text objects and motions
Plug 'christoomey/vim-system-copy'

" This plugin provides several pairs of bracket maps.
" ... for my purposes this also provides a handy way to encode html entities
Plug 'tpope/vim-unimpaired'

" :Ag is like :grep but with `ag`
Plug 'rking/ag.vim'

" Easily comment/uncomment lines in many languages
Plug 'tomtom/tcomment_vim'

" Git bindings
Plug 'tpope/vim-fugitive'

" Auto-add `end` in Ruby, `endfunction` in Vim, etc
Plug 'tpope/vim-endwise'

" Easily search for, substitute, and abbreviate multiple variants of a word.
" Also coerce variable names to other styles (snake case, camel case, etc)
Plug 'tpope/vim-abolish'

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
Plug 'benekastah/neomake' " run yarn install

" Autoformat code!
Plug 'sbdchd/neoformat'

" Line up text nicely (for projects that are used to the convention)
Plug 'godlygeek/tabular'

" Let's try COC for auto complete and LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Automatically match any brackets, parentheses or quotes when you’re typing
Plug 'Raimondi/delimitMate'

" A Vim wrapper for running tests on different granularities.
Plug 'janko-m/vim-test'

" Switching from single to multiple line statements
" gS to split into multiple lines
" gJ to join into one line
Plug 'AndrewRadev/splitjoin.vim'

" Vim and Tmux sitting in a tree ...
" ----------------------------------

" To navigate with ctrl+h/j/k/l across tmux and vim windows
Plug 'christoomey/vim-tmux-navigator'

" Make vim and tmux work together with some crazy voodoo sorcery
Plug 'christoomey/vim-tmux-runner'
