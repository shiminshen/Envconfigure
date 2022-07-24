lua require('plugins')
lua require('init')

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

let s:core_conf_files = [
      \ 'autocommands.vim',
      \ 'mappings.vim',
      \ 'plugins.vim',
      \ ]

for s:fname in s:core_conf_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor
