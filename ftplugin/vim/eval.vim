"===  Load Always  ===                                                    {{{1
command! -buffer -range Eval  :cal EvalVimScriptRegion(<line1>,<line2>)
vnoremap <buffer> <silent> <cr>   :Eval<CR>


"===  Load Once  ===                                                      {{{1
if exists('g:loaded_vim_dev_plugin_ftvim_eval')
    finish
endif

let g:loaded_vim_dev_plugin_ftvim_eval = 1

fun! EvalVimScriptRegion(s,e)
  let lines = getline(a:s,a:e)
  let file = tempname()
  cal writefile(lines,file)
  redir @e
  silent exec ':source '.file
  cal delete(file)
  redraw
  redir END
  echo "Region evaluated."

  if strlen(getreg('e')) > 0
    10new
    redraw
    silent file "EvalResult"
    setlocal noswapfile  buftype=nofile bufhidden=wipe
    setlocal nobuflisted nowrap cursorline nonumber fdc=0
    " syntax init
    set filetype="eval"
    syn match ErrorLine +^E\d\+:.*$+
    hi link ErrorLine Error
    silent $put =@e
  endif
endf

