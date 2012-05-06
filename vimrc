fun SetupVAM()
   set runtimepath+=~/vim-addons/vim-addon-manager
   " commenting try .. endtry because trace is lost if you use it.
   " There should be no exception anyway
   " try
   "     call vam#ActivateAddons(['pluginA', 'pluginB'], {'auto_install' : 0})
     " pluginA could be github:YourName see vam#install#RewriteName()
   " catch /.*/
   "  echoe v:exception
   " endtry
endf
call SetupVAM()
 " experimental: run after gui has been started (gvim) [3]
 " option1:  au VimEnter * call SetupVAM()
 " option2:  au GUIEnter * call SetupVAM()
 " See BUGS sections below [*]
