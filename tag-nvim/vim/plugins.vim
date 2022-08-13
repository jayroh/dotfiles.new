" Color schemes / themes
Plug 'nanotech/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'

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

" ag for vim
Plug 'rking/ag.vim'

" Sort using text objects and motions
Plug 'christoomey/vim-sort-motion'

" Copy to system clipboard using text objects and motions
Plug 'christoomey/vim-system-copy'

" This plugin provides several pairs of bracket maps.
" ... for my purposes this also provides a handy way to encode html entities
Plug 'tpope/vim-unimpaired'

" Easily comment/uncomment lines in many languages
Plug 'tomtom/tcomment_vim'

" Git bindings
Plug 'tpope/vim-fugitive'

" Octo GitHub goodness
Plug 'kyazdani42/nvim-web-devicons'
Plug 'pwntester/octo.nvim'

" Auto-add `end` in Ruby, `endfunction` in Vim, etc
Plug 'tpope/vim-endwise'

" Easily search for, substitute, and abbreviate multiple variants of a word.
" Also coerce variable names to other styles (snake case, camel case, etc)
Plug 'tpope/vim-abolish'

" Fuzzy-finder
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

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

" LSP and completion
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

" Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Automatically match any brackets, parentheses or quotes when you’re typing
Plug 'Raimondi/delimitMate'

" A Vim wrapper for running tests on different granularities.
Plug 'vim-test/vim-test'

" Switching from single to multiple line statements
" gS to split into multiple lines
" gJ to join into one line
Plug 'AndrewRadev/splitjoin.vim'

" Vim and Tmux sitting in a tree ...
" ----------------------------------

" Set up statusline theme(s)
Plug 'edkolev/tmuxline.vim'

" To navigate with ctrl+h/j/k/l across tmux and vim windows
Plug 'christoomey/vim-tmux-navigator'

" Make vim and tmux work together with some crazy voodoo sorcery
Plug 'christoomey/vim-tmux-runner'
