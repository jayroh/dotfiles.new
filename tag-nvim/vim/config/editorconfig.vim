let g:EditorConfig_exclude_patterns = ['fugitive://.*']

if has("unix")
  let s:uname = system("uname")

  if s:uname == "Darwin\n"
    let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
  else
    let g:EditorConfig_exec_path = '/usr/bin/editorconfig'
  endif
endif
