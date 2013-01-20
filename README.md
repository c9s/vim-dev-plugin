
# Vim plugin for developing vim script.


## Eval
    
## Vim Omni Completion

although vim has its own completion (C-x C-v), but it''s leak of something

vim omni supports:

    * builtin command name completion.
    * builtin function name completion.
    * runtime command completion.
    * runtime function name completion.
    * g:,s:.. scope completion.
    * option name completion.
    * autocommand event name completion
    * feature name completion.
    * &option


INSTALL
=======

copy `ftplugin/vim/omni.vim` to your `~/.vim/ftplugin/vim/omni.vim`
Dependencies see addon-info.json

vim-addon-manager plugin will install all dependencies for you automatically.
vim-addon- can be found on github.com/MarcWeber tlib is easy to find.


USE
======

function name:
    cal <C-x><C-o>

command name:
    com! <C-x><C-o>

var name:
    let g:<C-x><C-o>

autocmd event:
    autocmd <C-x><C-o>

option name:
    set <C-x><C-o>

feature name:
    if has(<C-x><C-o>

SCREENSHOT
==========

![](http://cloud.github.com/downloads/c9s/vimomni.vim/Screen_shot_2010-01-10_at_10.44.58_AM.png)
![](http://cloud.github.com/downloads/c9s/vimomni.vim/Screen_shot_2010-01-10_at_10.44.45_AM.png)
![](http://cloud.github.com/downloads/c9s/vimomni.vim/Screen_shot_2010-01-10_at_10.44.30_AM.png)

GOTO function
============
vim-addon-goto-thing-at-cursor remaps gf. By typing gf on a function Vim will
attempt to jump to its definition. This implementation is not using tags - so
its always up to date.


CUSTOMIZATION:
===============
If you dislike camel case matching see vim-addon-ocmpletion how to override the default

recommended additional plugins
==============================
You may find reload useful which reloads syntax and .vim files.
You still want to restart Vim to get rid of old definititions etc.

How to debug VimL ?
===================
use :debug a-command then (c)ontinue (r)eturn (n)ext (s)tep ..
if you get stackt traces of dict functions you can find the hints about the
declaration by :function {77} or such.

output var contents:


    echoe string(x)  
    echo x

    messages will redisplay everything printed by echoe


or the like

How to debug all calls of a function F?

change



    fun F()
      " do something
    endf



to 



    fun F(...)
      debug return call(function('F2'), a:000)
    endf

    fun F2()
      " do something
    endf




then you can use viml debugger:

    (c)ontinue, (s)tep, (n)ext

and of course you can just type any viml code such as echo to debug vars

And of course you can always vim -V20/tmp/log to see all VimL lines being
executed.

Also see :h breaka etc

If you get error messages suchas 23.34.23
line 3 This mean that the methods 23 34 23 are memebers of dictionaries.
You can view the code by :function{23}
(TODO: Add this to VimLGotoLastError)

If you get traces VimLGotoLastError tries to find the location where the error happened
adding the error message. It often works - but not aways

How to debug syntax scripts ?
=============================

Note: echo lines are ignored by Vim. However you can run an indentation
function manually and read them:

fun MyIndent(lnum)
  echo 'debug ..'
  return 1
endfun

Then you can debug indentation of current line ..
:echo MyIndent(line('.'))
^ here you can use debug etc.

Howto write a good Vim plugin ?
===============================
Hard question. There are different styles. I like the following:

- Don't start from scratch if you can also join an existing project.
  So do some research or ask on #vim

- Try reusing code. vim-addon-manager allows to install dependencies easily.

- Consider using a VCS (eg git) so that other devs can join and help you more
  easily (or continue your project if you lost interest).

- put code which is not run on every startup into autoload/ files
  Thus the plugin/ files ideally only contain the setup and user interface.

- If you need configurations try binding a global dict the user can set in its
  .vimrc to a short buffer local var. Set settings if they have not been set by
  the user. An example can be seen in autoload/vim_dev_plugin.vim which allows
  the user to overwrite vim_scan_func in his .vimrc in this way:
  let g:vim_dev = { 'vim_scan_func' : ... }

- If you want to let the user set configurations but provide defaults first
  put all your setup code into an autoload function setting up defaults. Example:

  plugin/foo.vim:
    call foo_setup#Setup()

  autoload/foo_setup.vim:
    let s:did_setup = 0
    fun! foo_setup#Setup()
      " do this once only:
      if s:did_setup | return | endif
      let s:did_setup = 1

      setup mappings etc
    endf


  Then user or other plugins can patch anywhere (.vimrc, au commands):

  call foo_setup#Setup()
  " do the patching
