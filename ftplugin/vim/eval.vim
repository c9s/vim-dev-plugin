command! -buffer -range Eval  :cal vim_dev_plugin#EvalVimScriptRegion(<line1>,<line2>)
vnoremap <buffer> <silent> <cr>   :Eval<CR>
