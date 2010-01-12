
Vim Omni Completion
===================
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


INSTALL
=======

copy `ftplugin/vim/omni.vim` to your `~/.vim/ftplugin/vim/omni.vim`


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
