lua require('plugins')
lua require('init')

let s:core_conf_files = [
      \ 'mappings.vim',
      \ 'plugins.vim',
      \ ]

for s:fname in s:core_conf_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor
