set termguicolors
set colorcolumn=80                " Highlight the 80 character column
set relativenumber                " Use relative line numbers
set number                        " Also show the current line number
set cursorline                    " Highlight the current line

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Configure netrw style
let g:netrw_liststyle=3

" Configure lualine
lua << END
require('lualine').setup {
  options = { theme = 'dracula' }
}
END

" Use a different indent line character
let g:indentLine_char = '⦙'
