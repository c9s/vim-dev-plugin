
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
    let comps = [ ]

    " find functions
    let lines = getline(1,'$')
    let f_ptn =  '\(^\s*fun[ction]*!\?\s\+\)\@<=\([sgb]:\I*\i*\|\I\i*\)'
    let f_comps = [ ]
    for line in lines
      if line =~ f_ptn
        cal add(f_comps,matchstr( line , f_ptn ))
      endif
    endfor

    " find variables
    let v_ptn = '\(^\s*let\s\+\)\@<=\([a-zA-Z0-9:_]\+\)'
    let v_comps = [ ]
    for line in lines
      if line =~ v_ptn
        cal add(v_comps,matchstr(line,v_ptn))
      endif
    endfor

    echo b:context
    echo b:tokens

    if len(b:tokens) > 0
      let t = remove(b:tokens,-1)
      echo t
      sleep 1
      if t =~ 'call\?'
        cal extend(comps,f_comps)
        cal extend(comps,s:RuntimeFunList())
      elseif t =~ 'let'
        cal extend(comps,v_comps)
        cal extend(comps,s:RuntimeVarList())
      else
      endif
    endif

    "let base = a:base
    "let base = substitute(base,'^g:','','')
    "cal filter(comps, "v:val =~ '^" . base . "'" )
    "let lastToken = remove(b:tokens,-1)
    "if lastToken =~ 'let'
    " find functions
    "echo comps
    "sleep 2
    return comps
  endif
endf

fun! s:RuntimeVarList()
  redir => varlist
  silent! let
  redir END
  let list = split(varlist,"\n")
  cal map(list,'matchstr(v:val,''^[a-zA-Z0-9:_#.]\+'')')
  cal map(list,'substitute(v:val,''^\([A-Z]\)'',''g:\1'',"")')
  return list
endf

fun! s:RuntimeFunList()
  redir => flist
  silent! fun
  redir END
  let list = split(flist,"\n")
  cal map(list,'matchstr(v:val,''\(function\s\)\@<=[a-zA-Z0-9_<>#:]\+'')')
  "cal map(list,'substitute(v:val,''^\([A-Z]\)'',''g:\1'',"")')
  return list
endf

setlocal omnifunc=VimOmniComplete
"echo s:RuntimeVarList()
"echo s:RuntimeFunList()
