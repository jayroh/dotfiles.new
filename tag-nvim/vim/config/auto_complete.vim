let g:deoplete#enable_at_startup=1
let g:SuperTabDefaultCompletionType = "<c-n>"

try
  call remote#host#RegisterPlugin('python3', '/Users/shougo/.vim/bundle/deoplete.nvim/rplugin/python3/deoplete.py', [
      \ {'sync': 1, 'name': 'DeopleteInitializePython', 'type': 'command', 'opts': {}},
     \ ])
catch  /.*/
  " no-op
endtry
