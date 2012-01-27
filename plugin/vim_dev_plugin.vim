" exec vam#DefineAndBind('s:c','vim_dev','{}')
if !exists('vim_dev') | let vim_dev = {} | endif | let s:c = vim_dev
let s:c.complete_lhs = get(s:c, 'complete_lhs', '<c-x><c-o>')

command! -nargs=0 VimLGotoLastError call vim_dev_plugin#VimLGotoLastError()
