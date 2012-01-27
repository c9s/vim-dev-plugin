" exec vam#DefineAndBind('s:c','vim_dev','{}')
if !exists('vim_dev') | let vim_dev = {} | endif | let s:c = vim_dev

call on_thing_handler#AddOnThingHandler('b', funcref#Function('vim_dev_plugin#GetFuncLocation'))

" smart VimL completion also supporting CamelCase like matching unless you change the default

call vim_addon_completion#InoremapCompletions(s:c, [
   \ { 'setting_keys' : ['complete_lhs'], 'fun': 'vim_dev_plugin#VimOmniComplete'},
   \ ] )
