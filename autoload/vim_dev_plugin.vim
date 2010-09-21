" vim:fdm=marker:
" Plugin:  Vim Omni Completion
" Version: 0.22
" Author:  Cornelius (林佑安)
" Contributor: Marc Weber (marco-oweber@gmx.de)
" Email:   cornelius.howl@gmail.com

if !exists('g:vim_dev') | let g:vim_dev = {} | endif | let s:c = g:vim_dev 
let s:c['vim_scan_func'] = get(s:c, 'vim_scan_func', {'func' : funcref#Function('vim_dev_plugin#ScanFunc'), 'version': 10, 'use_file_cache':1} )

let s:debug = 0

" builtin function {{{
" let s:builtin_function_list =  [
"     \"abs(", "add(", "append(", "argc(", "argidx(",
"     \"argv(", "atan(", "browse(", "browsedir(", "bufexists(", "buflisted(", "bufloaded(",
"     \"bufname(", "bufnr(", "bufwinnr(", "byte2line(", "byteidx(", "call(", "ceil(",
"     \"changenr(", "char2nr(", "cindent(", "clearmatches(", "col(", "complete(",
"     \"complete_add(", "complete_check(", "confirm(", "copy(", "cos(", "count(",
"     \"cscope_connection(", "cursor(", "deepcopy(", "delete(", "did_filetype(",
"     \"diff_filler(", "diff_hlID(", "empty(", "escape(", "eval(", "eventhandler(",
"     \"executable(", "exists(", "expand(", "extend(", "feedkeys(", "filereadable(",
"     \"filewritable(", "filter(", "finddir(", "findfile(", "float2nr(", "floor(",
"     \"fnameescape(", "fnamemodify(", "foldclosed(", "foldclosedend(", "foldlevel(",
"     \"foldtext(", "foldtextresult(", "foreground(", "function(", "garbagecollect(",
"     \"get(", "getbufline(", "getbufvar(", "getchar(", "getcharmod(", "getcmdline(",
"     \"getcmdpos(", "getcmdtype(", "getcwd(", "getfontname(", "getfperm(", "getfsize(",
"     \"getftime(", "getftype(", "getline(", "getloclist(", "getmatches(", "getpid(",
"     \"getpos(", "getqflist(", "getreg(", "getregtype(", "gettabwinvar(", "getwinposx(",
"     \"getwinposy(", "getwinvar(", "glob(", "globpath(", "has(", "has_key(",
"     \"haslocaldir(", "hasmapto(", "histadd(", "histdel(", "histget(", "histnr(", "hlID(",
"     \"hlexists(", "hostname(", "iconv(", "indent(", "index(", "input(", "inputdialog(",
"     \"inputlist(", "inputrestore(", "inputsave(", "inputsecret(", "insert(",
"     \"isdirectory(", "islocked(", "items(", "join(", "keys(", "len(", "libcall(",
"     \"libcallnr(", "line(", "line2byte(", "lispindent(", "localtime(", "log10(", "map(",
"     \"maparg(", "mapcheck(", "match(", "matchadd(", "matcharg(", "matchdelete(",
"     \"matchend(", "matchlist(", "matchstr(", "max(", "min(", "mkdir(", "mode(",
"     \"nextnonblank(", "nr2char(", "pathshorten(", "pow(", "prevnonblank(", "printf(",
"     \"pumvisible(", "range(", "readfile(", "reltime(", "reltimestr(", "remote_expr(",
"     \"remote_foreground(", "remote_peek(", "remote_read(", "remote_send(", "remove(",
"     \"rename(", "repeat(", "resolve(", "reverse(", "round(", "search(", "searchdecl(",
"     \"searchpair(", "searchpairpos(", "searchpos(", "server2client(", "serverlist(",
"     \"setbufvar(", "setcmdpos(", "setline(", "setloclist(", "setmatches(", "setpos(",
"     \"setqflist(", "setreg(", "settabwinvar(", "setwinvar(", "shellescape(", "simplify(",
"     \"sin(", "sort(", "soundfold(", "spellbadword(", "spellsuggest(", "split(", "sqrt(",
"     \"str2float(", "str2nr(", "strftime(", "stridx(", "string(", "strlen(", "strpart(",
"     \"strridx(", "strtrans(", "submatch(", "substitute(", "synID(", "synIDattr(",
"     \"synIDtrans(", "synstack(", "system(", "tabpagebuflist(", "tabpagenr(",
"     \"tabpagewinnr(", "tagfiles(", "taglist(", "tempname(", "tolower(", "toupper(", "tr(",
"     \"trunc(", "type(", "values(", "virtcol(", "visualmode(", "winbufnr(", "wincol(",
"     \"winheight(", "winline(", "winnr(", "winrestcmd(", "winrestview(", "winsaveview(",
"     \"winwidth(", "writefile("]"}}}
" builtin commands {{{
let s:builtin_command_list = [
      \"abclear", "argdo", "argument", "belowright",
      \"bNext", "breakdel", "buffer", "caddbuffer", "cbuffer", "cexpr", "cgetfile",
      \"checktime", "cnewer", "colder", "continue", "cquit", "delcommand", "diffoff",
      \"diffupdate", "drop", "echomsg", "emenu", "endtry", "exusage", "find",
      \"foldclose", "function", "hardcopy", "helptags", "if", "isearch", "jumps",
      \"keepmarks", "language", "lcd", "leftabove", "lgetbuffer", "lgrepadd",
      \"llast", "lmapclear", "lnfile", "lockmarks", "lpfile", "ltag", "make",
      \"menutranslate", "mkview", "mzfile", "next", "number", "options", "perldo",
      \"ppop", "Print", "promptrepl", "ptjump", "ptprevious", "pwd", "quit", "redir",
      \"registers", "rewind", "rubydo", "sall", "sball", "sbnext", "sbuffer",
      \"setfiletype", "sfirst", "simalt", "smap", "snext", "snoremap", "source",
      \"spellrepall", "sprevious", "startinsert", "stopinsert", "sunmenu", "t",
      \"tabedit", "tabmove", "tabonly", "tag", "tclfile", "tjump", "tnext",
      \"trewind", "tunmenu", "undolist", "verbose", "vimgrep", "vmapclear", "while",
      \"winsize", "wq", "wviminfo", "xmap", "XMLent", "xnoremenu", "aboveleft",
      \"argedit", "ascii", "bfirst", "botright", "breaklist", "buffers", "caddexpr",
      \"cc", "cfile", "change", "clast", "cnext", "colorscheme", "copen", "crewind",
      \"delete", "diffpatch", "digraphs", "dsearch", "echon", "emenu*", "endwhile",
      \"file", "finish", "folddoclosed", "goto", "help", "hide", "ijump", "isplit",
      \"k", "laddbuffer", "last", "lchdir", "lexpr", "lgetexpr", "lhelpgrep",
      \"llist", "lnewer", "lNfile", "lockvar", "lprevious", "lvimgrep", "mark",
      \"mkexrc", "mkvimrc", "mzscheme", "Next", "omapclear", "pclose", "pop",
      \"preserve", "profdel", "psearch", "ptlast", "ptrewind", "pyfile", "quitall",
      \"redo", "resize", "right", "rubyfile", "sandbox", "sbfirst", "sbNext",
      \"scriptencoding", "setglobal", "shell", "slast", "smapclear", "sNext",
      \"snoreme", "spelldump", "spellundo", "srewind", "startreplace", "stselect",
      \"suspend", "tab", "tabfind", "tabnew", "tabprevious", "tags", "tearoff",
      \"tlast", "tNext", "try", "unabbreviate", "unhide", "version", "vimgrepadd",
      \"vnew", "wincmd", "wnext", "wqall", "X", "xmapclear", "XMLns", "xunme", "all",
      \"argglobal", "badd", "blast", "bprevious", "brewind", "bunload", "caddfile",
      \"cclose", "cfirst", "changes", "clist", "cNext", "comclear", "copy",
      \"cunabbrev", "delfunction", "diffput", "display", "dsplit", "edit", "endfor",
      \"enew", "files", "first", "folddoopen", "grep", "helpfind", "history",
      \"ilist", "iunabbrev", "keepalt", "laddexpr", "later", "lclose", "lfile",
      \"lgetfile", "list", "lmake", "lnext", "lnoremap", "lolder", "lrewind",
      \"lvimgrepadd", "marks", "mksession", "mode", "nbkey", "nmapclear", "only",
      \"pedit", "popu", "previous", "profile", "ptag", "ptnext", "ptselect",
      \"python", "read", "redraw", "retab", "rightbelow", "runtime", "sargument",
      \"sblast", "sbprevious", "scriptnames", "setlocal", "sign", "sleep", "sme",
      \"sniff", "snoremenu", "spellgood", "spellwrong", "stag", "stjump", "sunhide",
      \"sview", "tabclose", "tabfirst", "tabnext", "tabrewind", "tcl", "tfirst",
      \"tm", "topleft", "tselect", "undo", "unlockvar", "vertical", "visual",
      \"vsplit", "windo", "wNext", "write", "xall", "xme", "xnoremap", "xunmenu",
      \"argadd", "arglocal", "ball", "bmodified", "break", "browse", "bwipeout",
      \"call", "cd", "cgetbuffer", "chdir", "close", "cnfile", "compiler", "cpfile",
      \"cwindow", "delmarks", "diffsplit", "djump", "earlier", "else", "endfunction",
      \"ex", "filetype", "fixdel", "foldopen", "grepadd", "helpgrep", "iabclear",
      \"imapclear", "join", "keepjumps", "laddfile", "lbuffer", "left", "lfirst",
      \"lgrep", "ll", "lmap", "lNext", "loadview", "lopen", "ls", "lwindow", "match",
      \"mkspell", "move", "new", "nohlsearch", "open", "perl", "popup", "print",
      \"promptfind", "ptfirst", "ptNext", "put", "qall", "recover", "redrawstatus",
      \"return", "ruby", "rviminfo", "saveas", "sbmodified", "sbrewind", "set",
      \"sfind", "silent", "smagic", "smenu", "snomagic", "sort", "spellinfo",
      \"split", "startgreplace", "stop", "sunme", "syncbind", "tabdo", "tablast",
      \"tabNext", "tabs", "tcldo", "throw", "tmenu", "tprevious", "tu", "undojoin",
      \"update", "view", "viusage", "wall", "winpos", "wprevious", "wsverb", "xit",
      \"xmenu", "xnoreme", "yank", "argdelete", "args", "bdelete", "bnext",
      \"breakadd", "bufdo", "cabclear", "catch", "center", "cgetexpr", "checkpath",
      \"cmapclear", "cNfile", "confirm", "cprevious", "debuggreedy", "diffget",
      \"diffthis", "dlist", "echoerr", "elseif", "endif", "exit", "finally", "fold",
      \"for" ]
"}}}
" options {{{
let s:builtin_option_list = [
      \"acd", "ambiwidth", "arabicshape",
      \"autowriteall", "backupdir", "bdlay", "binary", "breakat", "bufhidden",
      \"cdpath", "cin", "cinwords", "columns", "completeopt", "cpo",
      \"cscopetagorder", "csverb", "deco", "dictionary", "directory", "ed",
      \"encoding", "errorfile", "exrc", "fdls", "fencs", "fileformats", "fmr",
      \"foldlevel", "foldtext", "fsync", "gfs", "gtl", "guioptions", "hf", "hk",
      \"hlsearch", "imak", "ims", "indentexpr", "is", "isp", "keywordprg",
      \"lazyredraw", "lispwords", "ls", "makeef", "maxmapdepth", "mfd", "mmd",
      \"modified", "mousemodel", "msm", "numberwidth", "operatorfunc", "pastetoggle",
      \"pexpr", "pmbfn", "printexpr", "pt", "readonly", "rightleft", "rtp", "sb",
      \"scroll", "sect", "sessionoptions", "shellpipe", "shellxquote", "showbreak",
      \"shq", "slm", "smd", "spc", "spf", "sr", "sta", "sts", "swapfile", "sxq",
      \"tabpagemax", "tags", "tbis", "terse", "thesaurus", "titleold",
      \"toolbariconsize", "tsr", "ttyfast", "tx", "ut", "verbosefile", "virtualedit",
      \"wb", "wfw", "wildcharm", "winaltkeys", "winminwidth", "wmnu", "write",
      \"ai", "ambw", "ari", "aw", "backupext", "beval", "biosk", "brk", "buflisted",
      \"cedit", "cindent", "clipboard", "com", "confirm", "cpoptions",
      \"cscopeverbose", "cuc", "def", "diff", "display", "edcompatible", "endofline",
      \"errorformat", "fcl", "fdm", "fex", "filetype", "fo", "foldlevelstart",
      \"formatexpr", "ft", "gfw", "gtt", "guipty", "hh", "hkmap", "ic", "imc",
      \"imsearch", "indentkeys", "isf", "isprint", "km", "lbr", "list", "lsp",
      \"makeprg", "maxmem", "mh", "mmp", "more", "mouses", "mzq", "nuw", "opfunc",
      \"patchexpr", "pfn", "popt", "printfont", "pumheight", "redrawtime",
      \"rightleftcmd", "ru", "sbo", "scrollbind", "sections", "sft", "shellquote",
      \"shiftround", "showcmd", "si", "sm", "sn", "spell", "spl", "srr", "stal",
      \"su", "swapsync", "syn", "tabstop", "tagstack", "tbs", "textauto", "tildeop",
      \"titlestring", "top", "ttimeout", "ttym", "uc", "vb", "vfile", "visualbell",
      \"wc", "wh", "wildignore", "window", "winwidth", "wmw", "writeany",
      \"anti", "arshape", "awa", "backupskip", "bex", "bioskey", "browsedir",
      \"buftype", "cf", "cink", "cmdheight", "comments", "consk", "cpt", "cspc",
      \"cul", "define", "diffexpr", "dy", "ef", "eol", "esckeys", "fcs", "fdn",
      \"ff", "fillchars", "foldclose", "foldmarker", "formatlistpat", "gcr", "ghr",
      \"guicursor", "guitablabel", "hi", "hkmapp", "icon", "imcmdline", "inc",
      \"indk", "isfname", "joinspaces", "kmp", "lcs", "listchars", "lw", "mat",
      \"maxmempattern", "mis", "mmt", "mouse", "mouseshape", "mzquantum", "odev",
      \"osfiletype", "patchmode", "ph", "preserveindent", "printheader", "pvh",
      \"remap", "rl", "ruf", "sbr", "scrolljump", "secure", "sh", "shellredir",
      \"shiftwidth", "showfulltag", "sidescroll", "smartcase", "so", "spellcapcheck",
      \"splitbelow", "ss", "startofline", "sua", "swb", "synmaxcol", "tag", "tal",
      \"tenc", "textmode", "timeout", "tl", "tpm", "ttimeoutlen", "ttymouse", "ul",
      \"vbs", "vi", "vop", "wcm", "whichwrap", "wildmenu", "winfixheight", "wiv",
      \"wop", "writebackup", "al", "antialias", "autochdir", "background",
      \"balloondelay", "bexpr", "bk", "bs", "casemap", "cfu", "cinkeys",
      \"cmdwinheight", "commentstring", "conskey", "cscopepathcomp", "csprg",
      \"cursorcolumn", "delcombine", "diffopt", "ea", "efm", "ep", "et", "fdc",
      \"fdo", "ffs", "fk", "foldcolumn", "foldmethod", "formatoptions", "gd", "go",
      \"guifont", "guitabtooltip", "hid", "hkp", "iconstring", "imd", "include",
      \"inex", "isi", "js", "kp", "linebreak", "lm", "lz", "matchpairs", "maxmemtot",
      \"mkspellmem", "mod", "mousef", "mouset", "nf", "oft", "pa", "path",
      \"pheader", "previewheight", "printmbcharset", "pvw", "report", "rlc", "ruler",
      \"sc", "scrolloff", "sel", "shcf", "shellslash", "shm", "showmatch",
      \"sidescrolloff", "smartindent", "softtabstop", "spellfile", "splitright",
      \"ssl", "statusline", "suffixes", "swf", "syntax", "tagbsearch", "tb", "term",
      \"textwidth", "timeoutlen", "tm", "tr", "ttm", "ttyscroll", "undolevels",
      \"vdir", "viewdir", "wa", "wd", "wi", "wildmode", "winfixwidth", "wiw",
      \"wrap", "writedelay", "ar", "autoindent", "backspace", "ballooneval",
      \"bg", "bkc", "bsdir", "cb", "ch", "cino", "cmp", "compatible", "copyindent",
      \"cscopeprg", "csqf", "cursorline", "dex", "digraph", "ead", "ei",
      \"equalalways", "eventignore", "fde", "fdt", "fileencoding", "fkmap",
      \"foldenable", "foldminlines", "formatprg", "gdefault", "gp", "guifontset",
      \"helpfile", "hidden", "hl", "ignorecase", "imdisable", "includeexpr", "inf",
      \"isident", "key", "langmap", "lines", "lmap", "ma", "matchtime", "mco", "ml",
      \"modeline", "mousefocus", "mousetime", "nrformats", "ofu", "para", "pdev",
      \"pi", "previewwindow", "printmbfont", "qe", "restorescreen", "ro",
      \"rulerformat", "scb", "scrollopt", "selection", "shell", "shelltemp",
      \"shortmess", "showmode", "siso", "smarttab", "sol", "spelllang", "spr",
      \"ssop", "stl", "suffixesadd", "switchbuf", "ta", "taglength", "tbi",
      \"termbidi", "tf", "title", "to", "ts", "tty", "ttytype", "updatecount", "ve",
      \"viewoptions", "wak", "weirdinvert", "wig", "wildoptions", "winheight", "wm",
      \"wrapmargin", "ws", "arab", "autoread", "backup", "balloonexpr",
      \"bh", "bl", "bsk", "ccv", "charconvert", "cinoptions", "cms", "complete",
      \"cot", "cscopequickfix", "cst", "cwh", "dg", "dip", "eadirection", "ek",
      \"equalprg", "ex", "fdi", "fen", "fileencodings", "flp", "foldexpr",
      \"foldnestmax", "fp", "gfm", "grepformat", "guifontwide", "helpheight",
      \"highlight", "hlg", "im", "imi", "incsearch", "infercase", "isk", "keymap",
      \"langmenu", "linespace", "loadplugins", "macatsui", "maxcombine", "mef",
      \"mls", "modelines", "mousehide", "mp", "nu", "omnifunc", "paragraphs",
      \"penc", "pm", "printdevice", "printoptions", "quoteescape", "revins", "rs",
      \"runtimepath", "scr", "scs", "selectmode", "shellcmdflag", "shelltype",
      \"shortname", "showtabline", "sj", "smc", "sp", "spellsuggest", "sps", "st",
      \"stmp", "sw", "sws", "tabline", "tagrelative", "tbidi", "termencoding",
      \"tgst", "titlelen", "toolbar", "tsl", "ttybuiltin", "tw", "updatetime",
      \"verbose", "viminfo", "warn", "wfh", "wildchar", "wim", "winminheight",
      \"wmh", "wrapscan", "ww", "altkeymap", "arabic", "autowrite", "backupcopy",
      \"bdir", "bin", "bomb", "bt", "cd", "ci", "cinw", "co", "completefunc", "cp",
      \"cscopetag", "csto", "debug", "dict", "dir", "eb", "enc", "errorbells",
      \"expandtab", "fdl", "fenc", "fileformat", "fml", "foldignore", "foldopen",
      \"fs", "gfn", "grepprg", "guiheadroom", "helplang", "history", "hls",
      \"imactivatekey", "iminsert", "inde", "insertmode", "iskeyword", "keymodel",
      \"laststatus", "lisp", "lpl", "magic", "maxfuncdepth", "menuitems", "mm",
      \"modifiable", "mousem", "mps", "number", "opendevice", "paste", "pex",
      \"pmbcs", "printencoding", "prompt", "rdt", "ri", "noacd", "noallowrevins",
      \"noantialias", "noarabic", "noarshape", "noautoread", "noaw",
      \"noballooneval", "nobinary", "nobk", "nobuflisted", "nocin", "noconfirm",
      \"nocopyindent", "nocscopeverbose", "nocuc", "nocursorline", "nodg",
      \"nodisable", "noeb", "noedcompatible", "noendofline", "noequalalways",
      \"noesckeys", "noex", "noexrc", "nofk", "nofoldenable", "nogdefault", "nohid",
      \"nohk", "nohkmapp", "nohls", "noic", "noignorecase", "noimc", "noimd",
      \"noinf", "noinsertmode", "nojoinspaces", "nolazyredraw", "nolinebreak",
      \"nolist", "nolpl", "noma", "nomagic", "noml", "nomodeline", "nomodified",
      \"nomousef", "nomousehide", "nonumber", "noopendevice", "nopi",
      \"nopreviewwindow", "nopvw", "noremap", "norevins", "norightleft", "norl",
      \"noro", "noru", "nosb", "noscb", "noscs", "nosft", "noshelltemp",
      \"noshortname", "noshowfulltag", "noshowmode", "nosm", "nosmartindent",
      \"nosmd", "nosol", "nosplitbelow", "nospr", "nossl", "nostartofline",
      \"noswapfile", "nota", "notagrelative", "notbi", "notbs", "noterse",
      \"notextmode", "notgst", "notimeout", "noto", "notr", "nottybuiltin", "notx",
      \"novisualbell", "nowarn", "noweirdinvert", "nowfw", "nowinfixheight", "nowiv",
      \"nowrap", "nowrite", "nowritebackup", "noai", "noaltkeymap", "noar",
      \"noarabicshape", "noautochdir", "noautowrite", "noawa", "nobeval", "nobiosk",
      \"nobl", "nocf", "nocindent", "noconsk", "nocp", "nocst", "nocul", "nodeco",
      \"nodiff", "noea", "noed", "noek", "noeol", "noerrorbells", "noet",
      \"noexpandtab", "nofen", "nofkmap", "nogd", "noguipty", "nohidden", "nohkmap",
      \"nohkp", "nohlsearch", "noicon", "noim", "noimcmdline", "noincsearch",
      \"noinfercase", "nois", "nojs", "nolbr", "nolisp", "noloadplugins", "nolz",
      \"nomacatsui", "nomh", "nomod", "nomodifiable", "nomore", "nomousefocus",
      \"nonu", "noodev", "nopaste", "nopreserveindent", "noprompt", "noreadonly",
      \"norestorescreen", "nori", "norightleftcmd", "norlc", "nors", "noruler",
      \"nosc", "noscrollbind", "nosecure", "noshellslash", "noshiftround",
      \"noshowcmd", "noshowmatch", "nosi", "nosmartcase", "nosmarttab", "nosn",
      \"nospell", "nosplitright", "nosr", "nosta", "nostmp", "noswf",
      \"notagbsearch", "notagstack", "notbidi", "notermbidi", "notextauto", "notf",
      \"notildeop", "notitle", "notop", "nottimeout", "nottyfast", "novb", "nowa",
      \"nowb", "nowfh", "nowildmenu", "nowinfixwidth", "nowmnu", "nowrapscan",
      \"nowriteany", "nows" ,"noakm", "noanti", "noarab", "noari", "noautoindent",
      \"noautowriteall", "nobackup", "nobin", "nobioskey", "nobomb", "noci",
      \"nocompatible", "noconskey", "nocscopetag", "nocsverb", "nocursorcolumn",
      \"nodelcombine", "nodigraph", "invacd", "invallowrevins", "invantialias",
      \"invarabic", "invarshape", "invautoread", "invaw", "invballooneval",
      \"invbinary", "invbk", "invbuflisted", "invcin", "invconfirm", "invcopyindent",
      \"invcscopeverbose", "invcuc", "invcursorline", "invdg", "invdisable",
      \"inveb", "invedcompatible", "invendofline", "invequalalways", "invesckeys",
      \"invex", "invexrc", "invfk", "invfoldenable", "invgdefault", "invhid",
      \"invhk", "invhkmapp", "invhls", "invic", "invignorecase", "invimc", "invimd",
      \"invinf", "invinsertmode", "invjoinspaces", "invlazyredraw", "invlinebreak",
      \"invlist", "invlpl", "invma", "invmagic", "invml", "invmodeline",
      \"invmodified", "invmousef", "invmousehide", "invnumber", "invopendevice",
      \"invpi", "invpreviewwindow", "invpvw", "invremap", "invrevins",
      \"invrightleft", "invrl", "invro", "invru", "invsb", "invscb", "invscs",
      \"invsft", "invshelltemp", "invshortname", "invshowfulltag", "invshowmode",
      \"invsm", "invsmartindent", "invsmd", "invsol", "invsplitbelow", "invspr",
      \"invssl", "invstartofline", "invswapfile", "invta", "invtagrelative",
      \"invtbi", "invtbs", "invterse", "invtextmode", "invtgst", "invtimeout",
      \"invto", "invtr", "invttybuiltin", "invtx", "invvisualbell", "invwarn",
      \"invweirdinvert", "invwfw", "invwinfixheight", "invwiv", "invwrap",
      \"invwrite", "invwritebackup", "invai", "invaltkeymap", "invar",
      \"invarabicshape", "invautochdir", "invautowrite", "invawa", "invbeval",
      \"invbiosk", "invbl", "invcf", "invcindent", "invconsk", "invcp", "invcst",
      \"invcul", "invdeco", "invdiff", "invea", "inved", "invek", "inveol",
      \"inverrorbells", "invet", "invexpandtab", "invfen", "invfkmap", "invgd",
      \"invguipty", "invhidden", "invhkmap", "invhkp", "invhlsearch", "invicon",
      \"invim", "invimcmdline", "invincsearch", "invinfercase", "invis", "invjs",
      \"invlbr", "invlisp", "invloadplugins", "invlz", "invmacatsui", "invmh",
      \"invmod", "invmodifiable", "invmore", "invmousefocus", "invnu", "invodev",
      \"invpaste", "invpreserveindent", "invprompt", "invreadonly",
      \"invrestorescreen", "invri", "invrightleftcmd", "invrlc", "invrs", "invruler",
      \"invsc", "invscrollbind", "invsecure", "invshellslash", "invshiftround",
      \"invshowcmd", "invshowmatch", "invsi", "invsmartcase", "invsmarttab", "invsn",
      \"invspell", "invsplitright", "invsr", "invsta", "invstmp", "invswf",
      \"invtagbsearch", "invtagstack", "invtbidi", "invtermbidi", "invtextauto",
      \"invtf", "invtildeop", "invtitle", "invtop", "invttimeout", "invttyfast",
      \"invvb", "invwa", "invwb", "invwfh", "invwildmenu", "invwinfixwidth",
      \"invwmnu", "invwrapscan", "invwriteany", "invws", "invakm", "invanti",
      \"invarab", "invari", "invautoindent", "invautowriteall", "invbackup",
      \"invbin", "invbioskey", "invbomb", "invci", "invcompatible", "invconskey",
      \"invcscopetag", "invcsverb", "invcursorcolumn", "invdelcombine", "invdigraph",
      \"t_AB", "t_al", "t_bc", "t_ce", "t_cl", "t_Co", "t_cs", "t_Cs", "t_CS",
      \"t_CV", "t_da", "t_db", "t_dl", "t_DL", "t_EI", "t_F1", "t_F2", "t_F3",
      \"t_F4", "t_F5", "t_F6", "t_F7", "t_F8", "t_F9", "t_fs", "t_IE", "t_IS",
      \"t_k1", "t_K1", "t_k2", "t_k3", "t_K3", "t_k4", "t_K4", "t_k5", "t_K5",
      \"t_k6", "t_K6", "t_k7", "t_K7", "t_k8", "t_K8", "t_k9", "t_K9", "t_KA",
      \"t_kb", "t_kB", "t_KB", "t_KC", "t_kd", "t_kD", "t_KD", "t_ke", "t_KE",
      \"t_KF", "t_KG", "t_kh", "t_KH", "t_kI", "t_KI", "t_KJ", "t_KK", "t_kl",
      \"t_KL", "t_kN", "t_kP", "t_kr", "t_ks", "t_ku", "t_le", "t_mb", "t_md",
      \"t_me", "t_mr", "t_ms", "t_nd", "t_op", "t_RI", "t_RV", "t_Sb", "t_se",
      \"t_Sf", "t_SI", "t_so", "t_sr", "t_te", "t_ti", "t_ts", "t_ue", "t_us",
      \"t_ut", "t_vb", "t_ve", "t_vi", "t_vs", "t_WP", "t_WS", "t_xs", "t_ZH", "t_ZR",
      \"t_AF", "t_AL", "t_cd", "t_Ce", "t_cm"]
"}}}

let s:mapargments = [ "<buffer>", "<silent>", "<special>", "<script>", "<expr>","<unique>" ]

" features {{{
let s:features = [
  \"all_builtin_terms", "amiga", "arabic", "arp", "autocmd",
  \"balloon_eval", "balloon_multiline", "beos", "browse", "builtin_terms",
  \"byte_offset", "cindent", "clientserver", "clipboard", "cmdline_compl",
  \"cmdline_hist", "cmdline_info", "comments", "cryptv", "cscope", "compatible",
  \"debug", "dialog_con", "dialog_gui", "diff", "digraphs", "dnd", "dos32",
  \"dos16", "ebcdic", "emacs_tags", "eval", "ex_extra", "extra_search", "farsi",
  \"file_in_path", "filterpipe", "find_in_path", "float", "fname_case",
  \"folding", "footer", "fork", "gettext", "gui", "gui_athena", "gui_gtk",
  \"gui_gtk2", "gui_gnome", "gui_mac", "gui_motif", "gui_photon", "gui_win32",
  \"gui_win32s", "gui_running", "hangul_input", "iconv", "insert_expand",
  \"jumplist", "keymap", "langmap", "libcall", "linebreak", "lispindent",
  \"listcmds", "localmap", "mac", "macunix", "menu", "mksession", "modify_fname",
  \"mouse", "mouseshape", "mouse_dec", "mouse_gpm", "mouse_netterm",
  \"mouse_pterm", "mouse_sysmouse", "mouse_xterm", "multi_byte",
  \"multi_byte_encoding", "multi_byte_ime", "multi_lang", "mzscheme",
  \"netbeans_intg", "netbeans_enabled", "ole", "os2", "osfiletype", "path_extra",
  \"perl", "postscript", "printer", "profile", "python", "qnx", "quickfix",
  \"reltime", "rightleft", "ruby", "scrollbind", "showcmd", "signs",
  \"smartindent", "sniff", "startuptime", "statusline", "sun_workshop", "spell",
  \"syntax", "syntax_items", "system", "tag_binary", "tag_old_static",
  \"tag_any_white", "tcl", "terminfo", "termresponse", "textobjects", "tgetent",
  \"title", "toolbar", "unix", "user_commands", "viminfo", "vim_starting",
  \"vertsplit", "virtualedit", "visual", "visualextra", "vms", "vreplace",
  \"wildignore", "wildmenu", "windows", "winaltkeys", "win16", "win32", "win64",
  \"win32unix", "win95", "writebackup", "xfontset", "xim", "xsmp",
  \"xsmp_interact", "xterm_clipboard", "xterm_save", "\x11" ]
"}}}

let s:command_attr = [ 
      \'-range',
      \'-range=%',
      \'-range=',
      \'-count=',
      \'-bang',
      \'-bar',
      \'-register',
      \'-buffer',
      \'-nargs=0',
      \'-nargs=1',
      \'-nargs=*',
      \'-nargs=?',
      \'-nargs=+']

let s:command_complete = [
    \'-complete=',	
    \'-complete=augroup',	
    \'-complete=buffer',	
    \'-complete=command',	
    \'-complete=dir',		
    \'-complete=environment',	
    \'-complete=event',		
    \'-complete=expression',	
    \'-complete=file',		
    \'-complete=shellcmd',	
    \'-complete=function',	
    \'-complete=help',		
    \'-complete=highlight',	
    \'-complete=mapping',	
    \'-complete=menu',		
    \'-complete=option',	
    \'-complete=tag',		
    \'-complete=tag_listfiles',	
    \'-complete=var',		
    \'-complete=custom,',
    \'-complete=customlist,']

" autocmd {{{
let s:autocmd_events = [
  \"BufNewFile", "BufReadPre", "BufRead", "BufReadPost", "BufReadCmd",
  \"FileReadPre", "FileReadPost", "FileReadCmd", "FilterReadPre",
  \"FilterReadPost", "StdinReadPre", "StdinReadPost", "BufWrite", "BufWritePre",
  \"BufWritePost", "BufWriteCmd", "FileWritePre", "FileWritePost",
  \"FileWriteCmd", "FileAppendPre", "FileAppendPost", "FileAppendCmd",
  \"FilterWritePre", "FilterWritePost", "BufAdd", "BufCreate", "BufDelete",
  \"BufWipeout", "BufFilePre", "BufFilePost", "BufEnter", "BufLeave",
  \"BufWinEnter", "BufWinLeave", "BufUnload", "BufHidden", "BufNew",
  \"SwapExists", "FileType", "Syntax", "EncodingChanged", "TermChanged",
  \"VimEnter", "GUIEnter", "TermResponse", "VimLeavePre", "VimLeave",
  \"FileChangedShell", "FileChangedShellPost", "FileChangedRO", "ShellCmdPost",
  \"ShellFilterPost", "FuncUndefined", "SpellFileMissing", "SourcePre",
  \"SourceCmd", "VimResized", "FocusGained", "FocusLost", "CursorHold",
  \"CursorHoldI", "CursorMoved", "CursorMovedI", "WinEnter", "WinLeave",
  \"TabEnter", "TabLeave", "CmdwinEnter", "CmdwinLeave", "InsertEnter",
  \"InsertChange", "InsertLeave", "ColorScheme", "RemoteReply", "QuickFixCmdPre",
  \"QuickFixCmdPost", "SessionLoadPost", "MenuPopup", "User" ]
"}}}
" Cache Functions {{{
fun! GetCache(key)
  if exists('g:__cache_' . a:key )
    return g:__cache_{a:key}
  else
    return -1
  endif
endf

fun! s:Matches(s)
  return a:s =~ s:base || ( s:additional_regex != "" && a:s =~ s:additional_regex)
endf

fun! SetCache(key,val)
  let g:__cache_{a:key} = a:val
endf"}}}
fun! vim_dev_plugin#VimOmniComplete(findstart, base) "{{{
  if a:findstart
    let start = col('.') - 1
    let line = getline('.')
    while start > 0 && line[start - 1] =~ '[a-zA-Z-_#.]' 
      let start -= 1
    endwhile

    " b: g: s: prefix?
    let b:prefix_completion =
          \ (start > 2 && line[start-1] == ':')
            \ ? line[start-2]
            \ : ""

    let b:context = strpart( getline('.') , 0 , start + 1 )
    let b:tokens  = split(b:context,'\s\+')

    if b:context =~ '-complete=$'
      return col('.') - strlen('-complete=') - 1
    endif

    return start

    " for b: g: s: completion base starts after ':' !

  else

    let b:scanned_buf = vim_dev_plugin#ScanFuncLines(getline(1, line('$')), 'current file')

    let b:g_prefix = b:prefix_completion == 'g'

    let patterns = vim_addon_completion#AdditionalCompletionMatchPatterns(a:base
          \ , "vim_dev_plugin_completion_func", {'match_beginning_of_string': 0})
    " binding to local var so that I don't have to pass them again and again
    " See s:Matches
    let s:additional_regex = get(patterns, 'vim_regex', "")
    let s:base = a:base

    " a: completion
    if b:prefix_completion == 'a'
      call vim_dev_plugin#ACompletion()
      return []
    endif

    " s:completion
    if b:prefix_completion == 's'
      call vim_dev_plugin#SCompletion()
      return []
    endif

    " b:completion
    if b:prefix_completion == 'b'
      call vim_dev_plugin#BCompletion()
      return []
    endif

    if b:prefix_completion == ""
      " this is fast, so add these completions early
      call vim_dev_plugin#CompleteFunLocalLets()
    endif

    " g:completion
    if b:prefix_completion == 'g'
      call vim_dev_plugin#GCompletion()
      " use return? does the code below add more g: items?
      " also add dynamic g: vars?
      " TODO
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

      if s:debug
        echo b:tokens
        sleep 1
        echo b:context
        sleep 1
      endif

      let first = b:tokens[0]
      let t = remove(b:tokens,-1)

      if s:debug
        echo first
        sleep 1
        echo t
        sleep 1
      endif

      if t =~ 'call\?'
        " cal extend(comps,s:builtin_function_list)
        call s:CompleteBuiltinFunctions()
        cal extend(comps,f_comps)
        cal extend(comps,s:RuntimeFunList())
      elseif first =~ '[nvic]\?map$'
        cal extend(comps,s:mapargments)
        if t == ':'
          let coms = [ ]
          cal extend(coms,s:builtin_command_list)
          cal extend(coms,s:RuntimeComList())
          cal map(coms,'":".v:val')
          cal extend(comps,coms)
        endif
      " command completion
      elseif first =~ 'com\%[mand]!\?' && t =~ '-complete=custom\(list\)\?,$'
        " cal extend(comps,s:builtin_function_list)
        call s:CompleteBuiltinFunctions()
        cal extend(comps,f_comps)
        cal extend(comps,s:RuntimeFunList())
        " little patch for command completion function name
        cal map(comps,'substitute(v:val,"($","","")')
      elseif first =~ 'com\%[mand]!\?'
        cal extend(comps,s:command_attr)
        cal extend(comps,s:command_complete)
      elseif t =~ 'au\%[tocmd]!\?'
        cal extend(comps,s:autocmd_events)
      elseif t =~ '^has(["'']'
        cal extend(comps,s:features)
      elseif t =~ '^has($'
        cal extend(comps, map(copy(s:features),'''"'' . v:val . ''")'''))
      " expr context
      elseif t =~ '[=+-/*]' || t =~ '\w\+($' || t =~ '^\(if\|else\|elseif\|while\|for\|in\)'
        cal extend(comps,v_comps)
        cal extend(comps,s:RuntimeVarList())
        "cal extend(comps,s:builtin_function_list)
        call s:CompleteBuiltinFunctions()
        cal extend(comps,f_comps)
        cal extend(comps,s:RuntimeFunList())
      " option context
      elseif t =~ 'set\%[local]'
        cal extend(comps,s:builtin_option_list)
      " variable declare context
      elseif t =~ 'let'
        cal extend(comps,v_comps)
        cal extend(comps,s:RuntimeVarList())
      else
        cal extend(comps,f_comps)
        "cal extend(comps,s:builtin_function_list)
        call s:CompleteBuiltinFunctions()
        cal extend(comps,s:RuntimeFunList())

        cal extend(comps,s:builtin_command_list)
        cal extend(comps,s:RuntimeComList())
      endif
    else
      cal extend(comps,s:builtin_command_list)
      cal extend(comps,c_comps)
      cal extend(comps,s:RuntimeComList())
    endif

    let v_val_filter = "v:val =~ ".string('^\%(.*#\)\?'.a:base).' '.( s:additional_regex == "" ? "" : '|| v:val =~ '.string('^\%(.*#\)\?'.s:additional_regex)  )
    cal filter(comps, v_val_filter )
    cal sort(comps)

    for c in comps
      call complete_add(c)
    endfor

    if b:prefix_completion == ""

      " scanning Vim files the first time will take time..
      " take functions from autoload directories
      let autoload_functions = vim_dev_plugin#ListOfAutoloadFiles()
      for file in values(autoload_functions)
        if complete_check() | return [] | endif
        if expand(file) == expand('%:p')
          let file_content = b:scanned_buf
        else
          let file_content = cached_file_contents#CachedFileContents(file,
                \ s:c['vim_scan_func'], 0)
        endif
        let functions = file_content['declared autoload functions']
        cal filter(functions, substitute(v_val_filter,'v:val','v:key','g') )
        for [k,v] in items(functions)
          call complete_add({'word': k.'(', 'menu': v.args, 'info': v.args})
          unlet k v
        endfor
      endfor
    endif

  endif
endf"}}}
fun! s:RuntimeComList() "{{{
  let c = GetCache('vim_runtime_cmd')
  if type(c) == 3
    return c
  endif

  redir => out
  silent! com
  redir END
  let list = split(out,"\n")
  cal remove( list , 0 )   " remove title
  cal map(list,'matchstr(v:val,''\(^!\?\s*\)\@<=[a-zA-Z0-9]\+'')')

  cal SetCache('vim_runtime_cmd',list)
  return list
endf"}}}
fun! s:RuntimeVarList() "{{{
  let c = GetCache('vim_runtime_var' . b:g_prefix)
  if type(c) == 3
    return c
  endif

  redir => varlist
  silent! let
  redir END
  let list = split(varlist,"\n")
  cal map(list,'matchstr(v:val,''^[a-zA-Z0-9:_#.]\+'')')
  if b:g_prefix 
    cal map(list,'substitute(v:val,''^\([A-Z]\)'',''g:\1'',"")')
  endif
  cal SetCache('vim_runtime_var' . b:g_prefix ,list)
  return list
endf"}}}

fun! s:RuntimeFunList() "{{{
  " this func completes global functions only
  " see continue below

  let c = GetCache('vim_runtime_fun' . b:g_prefix)
  if type(c) != type({})
    " build cache

    redir => flist
    silent! fun
    redir END
    unlet c
    let c = {}
    for l in split(flist,"\n")
      if l =~ '#\|SNR'
        " - s: functions are skipped because we only want s: functions of the
        "   current file to appear
        " - autoload functions (containing #) are skipped cause they are
        "   completed by scan func result
        continue
      endif
      " get name and args:
      let li = matchlist(l,'\([A-Za-z_]\+\)(\([^)]*\)')
      if len(li) > 0 && li[1] != ""
        let c[li[1]] = li[2]
      endif
    endfor
    cal SetCache('vim_runtime_fun' . b:g_prefix,c)
  endif

  for [k,v] in items(c)
    if s:Matches(k)
      call complete_add({'word': k.'(', 'menu': v, 'info': v})
    endif
    unlet k v
  endfor

  " old interface is no longer used here:
  return []
endf "}}}
fun! s:AutoloadPrefixes(funcs) "{{{
  let funcs = filter(copy(a:funcs),'v:val =~ ''\w\+#''')
  let heads = { }
  for f in funcs 
    let parts = split(f,'#')
    while len(parts) > 0
      cal remove(parts,-1)
      if len(parts) > 0
        let heads[ join(parts,"#") . '#' ] = 1
      endif
    endwhile
  endfor
  return keys(heads)
endf "}}}

fun! s:CompleteBuiltinFunctions()
  let func_lines = []
  let lines = readfile($VIMRUNTIME.'/doc/eval.txt')
  for idx in range(0, len(lines)-1)
    if lines[idx][:11] == "abs( {expr})"
      let start = idx
      " at abs\t  all function names are repeated a second time, this time
      " with a long description. stop here
    elseif lines[idx][:11] == "abs({expr})\t"
      let stop = idx
      break
    endif
  endfor

  let func = ""
  for idx in range(stop,start,-1)
    let func = substitute(lines[idx],'[ \t]\+',' ','g')." ".func
    let matches = matchlist(func, '^\([^( \t]\+\)(\([^)]*\))\(.*\)')
    if len(matches) > 0 && s:Matches(matches[1])
      cal complete_add({'word': matches[1].'(', 'menu': '('.matches[2].') ' .matches[3]})
      let func = ""
    endif
  endfor
endfun

" scan func - simple .vim file parser It can collect used and defined autoload functions "{{{1

let s:vl_regex = {}
let s:vl_regex['fap']='\%(\w\+#\)\+' " match function autoload prefix ( blah#foo#)
let s:vl_regex['ofp']='\%(\w\+#\)*' " optional match function location prefix ( blah#foo#)
let s:vl_regex['fp']='\%('.s:vl_regex['ofp'].'\|s:\|g:\)' " match any (or no function prefix)
let s:vl_regex['Fn']='\w*'  " match function name
let s:vl_regex['uFn']='\u\w*'  " match user function name
let s:vl_regex['function']='^\s*fun\%(ction\)\=!\=\s\+'
" match function declaration and get function name / doesn't match fun s:Name
let s:vl_regex['fn_decl']=s:vl_regex['function'].'\zs'.s:vl_regex['fp'].s:vl_regex['uFn'].'\ze('

fun! vim_dev_plugin#ScanFunc(filename)
  return vim_dev_plugin#ScanFuncLines(readfile(a:filename), a:filename)
endf

" scan a vim file returning list of defined functions
fun! vim_dev_plugin#ScanFuncLines(lines, filename)
  let lines = a:lines

  let declared_functions = vim_dev_plugin#GetAllDeclaredFunctions(
				      \ lines)
  let declared_autoload_functions = filter(deepcopy(declared_functions),
	      \ 'v:key =~ '.string(s:vl_regex['fap'].s:vl_regex['uFn']))
  let used_user_functions = vim_dev_plugin#GetAllUsedUserFunctions(
				      \ lines)
  let used_autoload_functions = filter(deepcopy(used_user_functions),
	      \ 'v:key =~ '.string(s:vl_regex['fap'].s:vl_regex['uFn']))
  let g:c = s:vl_regex['fap'].s:vl_regex['uFn']

  let vars_g = []
  let vars_b = []
  let vars_s = []

  let n = 1
  let in_fun = 0
  for l in lines
    if l =~ '^\s*fun'
      let in_fun = 1
    elseif l =~ '^\s*endf\s*$' || '^\sendfu'
      let in_fun = 0
    endif
    for i in split(l,'let\s\+\ze\%([sgb]:\)')[1:]
      let p = ''
      if len(i) > 2 && i[1] == ':'
        let p = i[0]
        let i=i[2:]
      endif
      let n = matchstr(i,'\zs[^=[\]()\n \t]*')

      if p == "" && !in_fun
        call add(vars_g, { 'word': n, 'menu': 'g: '.i[len(n):70], 'line': n })
      elseif p != ""
        call add(vars_{p}, { 'word': n, 'menu': p.': '.i[len(n):70], 'line': n })
      endif

    endfor
    let n = n+1
  endfor

  if type(declared_autoload_functions) != type({})
    throw filename
  endif

  return { 'declared functions' : declared_functions
       \ , 'declared autoload functions' : declared_autoload_functions
       \ , 'used autoload functions' : used_autoload_functions
       \ , 'used user functions' : used_user_functions
      \ , 'vars_g' : vars_g
      \ , 'vars_b' : vars_b
      \ , 'vars_s' : vars_s
       \ }
endf



" complete a: (arg names)
fun! vim_dev_plugin#CompleteFunLocalLets()
  let lidx = line('.')
  let r = []
  while lidx > 0
    let l = getline(lidx)
    if l =~ '^\s*fun'
      for x in r | call complete_add(x) | endfor
      return
    endif
    if l =~ '^\s*endf\s*$' || '^\sendfu'
      " not in func
      return
    endif
    for name in split(l,'let\s\+\ze\S')[1:]
      if len(name) > 2 && name[1] == ':' | continue | endif
      let n = matchstr(name,'\zs[^=[\]()\n \t]*')
      call add(r, {'word': n, 'menu': 'local let in func'})
    endfor
    let lidx = lidx -1
  endwhile
endf


" complete a: (arg names)
fun! vim_dev_plugin#ACompletion()
  let line = search('^\s*\%(fun\|endf\)', 'bn')
  if line > 0
    let l = getline(line)
    let nr = 1
    for arg in split(matchstr(getline(line), '(\zs[^)]*'),'\s*,\s*')
      if arg == '...'
        if !s:Matches('000') | continue | endif
        " a:0 a:1 etc are not worth adding. They are too short
        call complete_add({
              \ 'word': '000',
              \ 'menu': ' func arg nr: '.nr
              \ })
      else
        if !s:Matches('a:'.arg) | continue | endif
        call complete_add({
              \'word': arg,
              \'menu': ' func arg nr: '.nr
              \})
      endif
      let nr = nr +1
    endfor
  endif
endf

" complete s: (buffer scope names and functions)
fun! vim_dev_plugin#SCompletion()
  " let s: bindings
  for i in b:scanned_buf['vars_s']
    if !s:Matches(i.word) | continue | endif
    call complete_add(i)
  endfor
  " fun s:.. functions
  let scanned = b:scanned_buf
  for [n,value] in items(scanned['declared functions'])
    let line = value.line
    if n =~ '^s:'
      if !s:Matches(n) | continue | endif
      let info = ( has_key(value,'args') ? value.args : '').' func this buf line '. line
      call complete_add({
            \'word': n[2:].'(',
            \'menu': info,
            \'info': info 
            \})
      unlet n value line
    endif
  endfor
endf

" complete s: (buffer scope names and functions)
" yes, this only finds b: definitions in the current buffer (FIXME)
" Ideally parse all ftpluginfiles etc
fun! vim_dev_plugin#BCompletion()
  " let s: bindings
  for i in b:scanned_buf['vars_b']
    if !s:Matches(i.word) | continue | endif
    call complete_add(i)
  endfor
endf

fun! vim_dev_plugin#GCompletion()
  " let s: bindings
  for i in b:scanned_buf['vars_g']
    if !s:Matches(i.word) | continue | endif
    call complete_add(i)
  endfor
endf


" returns dictionary { "<functionname>" : <line_nr> , ... }
function! vim_dev_plugin#GetAllDeclaredFunctions(file_as_string_list)
  let functions = {}
  let line_nr = 1
  for l in a:file_as_string_list
    let function = matchstr(l,s:vl_regex['fn_decl'])
      if function !=  ""
	let functions[function] = { 'line': line_nr, 'args': matchstr(l, '(\zs[^)]*') }
      endif
    let line_nr = line_nr + 1
  endfor
  return functions
endfunction

" returns a dictionary { "function name": linenr, ...}
" thus the last occurence will be listed
function! vim_dev_plugin#GetAllUsedUserFunctions(file_as_string_list)
  let file = a:file_as_string_list
  let result = {}
  let line_nr=1
  for l in file
    if l =~ '^\s*"' || l =~ s:vl_regex['fn_decl']
      let line_nr = line_nr + 1
      continue " simple comment handling.. can be improved much
	       " also continue on function declarations
    endif
    let matches = map(split(l,s:vl_regex['fp'].s:vl_regex['uFn'].'(\zs\ze'),"matchstr(v:val,'".s:vl_regex['fp'].s:vl_regex['uFn']."(')")
    for m in map(matches,"substitute(v:val,'($','','')")
      if m == ""
	continue
      endif
      if !exists("result['".m."']")
	let result[m] = line_nr
      endif
    endfor
    let line_nr = line_nr+1
  endfor
  return result
endfunction

" path/autoload/foo/bar.vim -> foo#bar
fun! vim_dev_plugin#GetPrefix(path)
  return substitute(matchstr(a:path,'.*autoload[/\\]\zs.*\ze\.vim$'),'[/\\]','#','g')
endf


" returns list of all used autoload files
" If you have 2 autoload/file.vim files
" the one beeing first in runtimepath will be used
" returns dictionary { "prefix": "file", ... }
" file autoload/blah/ehh.vim results in prefix
" blah#
function! vim_dev_plugin#ListOfAutoloadFiles()
  let files = {}
  for path in reverse(split(&runtimepath,','))
    for file in split(globpath(expand(path.'/autoload'),"**/*.vim"),"\n")
      let prefix = vim_dev_plugin#GetPrefix(file)
      if !has_key(files, prefix)
        let files[prefix] = file
      endif
    endfor
  endfor
  return files
endfunction


fun! s:SplitCurrentLineAtCursor()
  let pos = col('.') -1
  let line = getline('.')
  return [strpart(line,0,pos), strpart(line, pos, len(line)-pos)]
endfunction

"|func only works with autoload functions 
"|     is intended to be used with vim-addon-goto-thing-at-cursor to jump to files.
"|     limitation: only finds first match (because FileInDirOfRuntimePath does so)
"|     returns either [[filename, linenr]]
"|     or [filename]. in case that function does not exist
"|     (than you can jump to the file and add it manually)
function! vim_dev_plugin#GetFuncLocation(...)
  let addNonExisting = 1
  if expand('%:e') != 'vim' | return  [] | endif
  let [b,a] = s:SplitCurrentLineAtCursor()
  let func = matchstr(b,'\zs[#_a-zA-Z0-9]*\ze$').matchstr(a,'^\zs[_#a-zA-Z0-9]*\ze')
  let results = vim_dev_plugin#FindFunction(func)
  if addNonExisting
    call extend(results, 
      \ map(split(&runtimepath,','),
           \ 'v:val.'.string("/autload/".substitute(func,'#','/','g'))))
  endif
  return results
endfunction

fun! vim_dev_plugin#FindFunction(func)
  let results = []
  let autofile_list = vim_dev_plugin#ListOfAutoloadFiles()
  let keys = keys(autofile_list)
  for [k, file]  in items(autofile_list)

    let file_info = cached_file_contents#CachedFileContents(file,
            \ s:c['vim_scan_func'], 0)
    let functions ={}
    call extend(functions, file_info['declared autoload functions'])
    call extend(functions, file_info['declared functions'])
    if has_key(functions, a:func)
      let line = functions[a:func]['line']
	call add(results, {'filename': file, 'line_nr': line})
    endif
    unlet k
    unlet file
  endfor
  if len(results) == 0
    let file = substitute(a:func,'#[^#]*$','','') 
    if has_key(autofile_list, file)
      return [autofile_list[file]]
    endif
  endif
  return results
endf


" jumps to this kind of error location:
" Error detected while processing function vim_dev_plugin#FindFunction:
" line   24: 
" see :messages

" TODO even put trace in quickfix ?
fun! vim_dev_plugin#VimLGotoLastError()

  let lines = tlib#cmd#OutputAsList('messages')

  " get line number from previous line which looks like 'line: 17'
  let get_line = 'let line_offset = matchstr(lines[l+1], '.string('^line\s*\zs\d\+\ze:$').')'

  " put error in the line below assuming the error message was in line +2
  let put_error = "exec 'normal o ERROR was:!'.lines[l+2].' ( remove this line by u(ndo) )'"

  let match_trace = '^Error detected while processing function \zs.*\ze:$'
  let match_processing_error = '^Error detected while processing \zs.*\ze:'

  for l in range(len(lines)-1, 0, -1)
    let trace = matchstr(lines[l], match_trace)
    if trace != ""
      let locations = split(trace,'\.\.')
      exec get_line
      let fun_locations = vim_dev_plugin#FindFunction(locations[-1])
      if len(fun_locations) == 0
        echo "no locations found for error line ".lines[l]
        break
      endif
      let location = eval(tlib#input#List("s","multiple locations found", map(fun_locations, 'string(v:val)') ))
      exec 'e '.fnameescape(location.filename)
      exec (location.line_nr+line_offset)
      " is this a good idea? use u to unde this change
      exec put_error
      break
    endif

    let file = matchstr(lines[l], match_processing_error)
    if file != ""
      exec get_line
      exec 'e '.fnameescape(file)
      exec line_offset
      exec put_error
      break
    endif
  endfor
endf
" vim:fdm=marker
