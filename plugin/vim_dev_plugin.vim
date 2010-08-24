" completion
call vim_addon_completion#RegisterCompletionFunc({
      \ 'description' : 'smart VimL completion also supporting CamelCase like matching unless you change the default',
      \ 'completeopt' : 'preview,menu,menuone',
      \ 'scope' : 'vim',
      \ 'func': 'vim_dev_plugin#VimOmniComplete'
      \ })

command! -nargs=0 VimLGotoLastError call vim_dev_plugin#VimLGotoLastError()
