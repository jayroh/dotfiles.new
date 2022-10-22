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
set sw=4
set ts=4
syntax enable
set background=light
silent! colorscheme solarized

" vim-textobj-rubyblock requires that the matchit.vim plugin is enabled.
runtime macros/matchit.vim

highlight Comment cterm=italic gui=italic

" config ruby host
let g:ruby_host_prog = '/Users/joel/.asdf/shims/neovim-ruby-host'

" snippet location
let g:vsnip_snippet_dir = '~/.dotfiles/tag-nvim/snippets'

" disable automatic folding
set nofoldenable

lua << EOF
  require('nvim_comment').setup()

  require('nvim-treesitter.configs').setup {
    endwise = {
      enable = true,
      },
    }

  require('nvim-lsp-installer').setup {
    automatic_installation = true
  }

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  local lspconfig = require("lspconfig")
  lspconfig.eslint.setup {
    on_attach = on_attach,
  }
  lspconfig.solargraph.setup {
    on_attach = on_attach,
    autoformat = false,
    checkGemVersion = false,
    folding = false,
    formatting = false,
    hover = false,
    useBundler = true,
  }
  lspconfig.html.setup {
    on_attach = on_attach,
  }
  lspconfig.jsonls.setup {
    on_attach = on_attach,
  }

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true
    },
  }

  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }

  require('leap').add_default_mappings()
EOF
