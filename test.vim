" =================
let g:var_test = 123
let s:var_foo = 123
let Var = 123

fun! g:Test()

endf

fun! s:Test()

endf

fun! s:test_foo()

endf

function! Foo()

endf
func!   Bar()

endf

let g:Obj = {  }
fun! g:Obj.foo()

endf
" =================
