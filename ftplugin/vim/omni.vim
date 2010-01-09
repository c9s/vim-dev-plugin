
let g:builtin_function_list =  [ "abs", "add", "append", "argc", "argidx",
    \"argv", "atan", "browse", "browsedir", "bufexists", "buflisted", "bufloaded",
    \"bufname", "bufnr", "bufwinnr", "byte2line", "byteidx", "call", "ceil",
    \"changenr", "char2nr", "cindent", "clearmatches", "col", "complete",
    \"complete_add", "complete_check", "confirm", "copy", "cos", "count",
    \"cscope_connection", "cursor", "deepcopy", "delete", "did_filetype",
    \"diff_filler", "diff_hlID", "empty", "escape", "eval", "eventhandler",
    \"executable", "exists", "expand", "extend", "feedkeys", "filereadable",
    \"filewritable", "filter", "finddir", "findfile", "float2nr", "floor",
    \"fnameescape", "fnamemodify", "foldclosed", "foldclosedend", "foldlevel",
    \"foldtext", "foldtextresult", "foreground", "function", "garbagecollect",
    \"get", "getbufline", "getbufvar", "getchar", "getcharmod", "getcmdline",
    \"getcmdpos", "getcmdtype", "getcwd", "getfontname", "getfperm", "getfsize",
    \"getftime", "getftype", "getline", "getloclist", "getmatches", "getpid",
    \"getpos", "getqflist", "getreg", "getregtype", "gettabwinvar", "getwinposx",
    \"getwinposy", "getwinvar", "glob", "globpath", "has", "has_key",
    \"haslocaldir", "hasmapto", "histadd", "histdel", "histget", "histnr", "hlID",
    \"hlexists", "hostname", "iconv", "indent", "index", "input", "inputdialog",
    \"inputlist", "inputrestore", "inputsave", "inputsecret", "insert",
    \"isdirectory", "islocked", "items", "join", "keys", "len", "libcall",
    \"libcallnr", "line", "line2byte", "lispindent", "localtime", "log10", "map",
    \"maparg", "mapcheck", "match", "matchadd", "matcharg", "matchdelete",
    \"matchend", "matchlist", "matchstr", "max", "min", "mkdir", "mode",
    \"nextnonblank", "nr2char", "pathshorten", "pow", "prevnonblank", "printf",
    \"pumvisible", "range", "readfile", "reltime", "reltimestr", "remote_expr",
    \"remote_foreground", "remote_peek", "remote_read", "remote_send", "remove",
    \"rename", "repeat", "resolve", "reverse", "round", "search", "searchdecl",
    \"searchpair", "searchpairpos", "searchpos", "server2client", "serverlist",
    \"setbufvar", "setcmdpos", "setline", "setloclist", "setmatches", "setpos",
    \"setqflist", "setreg", "settabwinvar", "setwinvar", "shellescape", "simplify",
    \"sin", "sort", "soundfold", "spellbadword", "spellsuggest", "split", "sqrt",
    \"str2float", "str2nr", "strftime", "stridx", "string", "strlen", "strpart",
    \"strridx", "strtrans", "submatch", "substitute", "synID", "synIDattr",
    \"synIDtrans", "synstack", "system", "tabpagebuflist", "tabpagenr",
    \"tabpagewinnr", "tagfiles", "taglist", "tempname", "tolower", "toupper", "tr",
    \"trunc", "type", "values", "virtcol", "visualmode", "winbufnr", "wincol",
    \"winheight", "winline", "winnr", "winrestcmd", "winrestview", "winsaveview",
    \"winwidth", "writefile"]

fun! VimOmniComplete(findstart, base)
  if a:findstart
    let start = col('.') - 1
    let line = getline('.')
    while start > 0 && line[start - 1] =~ '[a-zA-Z-_:#.]' 
      let start -= 1
    endwhile

    let b:context = strpart( getline('.') , 0 , start )
    let b:tokens  = split(b:context,'\s\+')
    return start
  else
    let b:g_prefix = 0
    if a:base =~ '^g:'
      let b:g_prefix = 1
    endif

    let comps = [ ]
    let lines = getline(1,'$')
    let f_ptn =  '\(^\s*fun[ction]*!\?\s\+\)\@<=\([sgb]:\I*\i*\|\I\i*\)'
    let v_ptn = '\(^\s*let\s\+\)\@<=\([a-zA-Z0-9:_]\+\)'
    let c_ptn = '\(^\s*com[mand]\*!\?\s\+\)\@<=[a-zA-Z]*'
    let v_comps = [ ]
    let f_comps = [ ]
    let c_comps = [ ]
    for line in lines
      if line =~ f_ptn
        cal add(f_comps,matchstr(line,f_ptn ))
      elseif line =~ v_ptn
        cal add(v_comps,matchstr(line,v_ptn))
      elseif line =~ c_ptn 
        cal add(c_comps,matchstr(line,c_ptn))
      endif
    endfor

    if len(b:tokens) > 0
      let t = remove(b:tokens,-1)
      echo t
      if t =~ 'call\?'
        cal extend(comps,g:builtin_function_list)
        cal extend(comps,f_comps)
        cal extend(comps,s:RuntimeFunList())
      elseif t =~ 'let'
        cal extend(comps,v_comps)
        cal extend(comps,s:RuntimeVarList())
      else
        cal extend(comps,s:RuntimeComList())

      endif
    else
      cal extend(comps,c_comps)
      cal extend(comps,s:RuntimeComList())
    endif


    "let base = substitute(base,'^g:','','')
    cal filter(comps, "v:val =~ '^" . a:base . "'" )
    "let lastToken = remove(b:tokens,-1)
    "if lastToken =~ 'let'
    " find functions
    "echo comps
    "sleep 2
    return comps
  endif
endf

fun! s:RuntimeComList()
  redir => out
  silent! com
  redir END
  let list = split(out,"\n")
  cal remove( list , 0 )   " remove title
  cal map(list,'matchstr(v:val,''\(^!\?\s*\)\@<=[a-zA-Z0-9]\+'')')
  cal sort(list)
  return list
endf


fun! s:RuntimeVarList()
  redir => varlist
  silent! let
  redir END
  let list = split(varlist,"\n")
  cal map(list,'matchstr(v:val,''^[a-zA-Z0-9:_#.]\+'')')
  if b:g_prefix 
    cal map(list,'substitute(v:val,''^\([A-Z]\)'',''g:\1'',"")')
  endif
  cal sort(list)
  return list
endf

fun! s:RuntimeFunList()
  redir => flist
  silent! fun
  redir END
  let list = split(flist,"\n")
  cal map(list,'matchstr(v:val,''\(function\s\)\@<=[a-zA-Z0-9_<>#:]\+'')')
  cal map(list,'substitute(v:val,''^\(<SNR>\d\+_\)'',''s:'',"")')

  if b:g_prefix 
    cal map(list,'substitute(v:val,''^\([A-Z]\)'',''g:\1'',"")')
  endif
  cal sort(list)
  return list
endf
setlocal omnifunc=VimOmniComplete

"echo s:RuntimeComList()
"echo s:RuntimeVarList()
"echo s:RuntimeFunList()
"cal <SNR>1_run_exe
