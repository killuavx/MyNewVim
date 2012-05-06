fun! SetupVAM() " {{{1
  set runtimepath+=~/vim-addons/vim-addon-manager
  " commenting try .. endtry because trace is lost if you use it.
  " There should be no exception anyway
  " try
  " pluginA could be github:YourName see vam#install#RewriteName()

  " I. Edit {{{2
  "   1. VisIncr
  "   2. Align%294
  "   3. NERD_Commenter, Fast Comment
  "   4. DoxygenToolkit, Doxygen style Comment
  "   5. sinpmate, 
  "      sinpmate-snippets, snippets rules
  "   6. MultiColor Mark
  call vam#ActivateAddons( [ 'VisIncr' , 
        \ 'Align%294'          , 
        \ 'The_NERD_Commenter' , 
        \ 'DoxygenToolkit'     , 
        \ 'snipmate' ,  'snipmate-snippets' ,
        \ 'Mark%1238' ] , {'auto_install':0})
  " }}}

  " II. View Window OR Exploder {{{2
  "   1. NERD_tree , File Exploder
  "   2. taglist
  "   3. TaskList TODO list
  "   4. Marks Browser
  "   5. ConqueTerm
  "   6. WinManager
  call vam#ActivateAddons( [ 'The_NERD_tree', 
        \ 'taglist', 
        \ 'TaskList'      , 
        \ 'bufexplorer.zip'    , 
        \ 'Marks_Browser' , 
        \ 'winmanager%1440', 
        \ 'Conque_Shell' ]   , {'auto_install':0})
  " }}}

  " III. Navigate {{{2
  "   1. L9, Be Depended By FuzzyFinder
  "   2. FuzzyFinder File,Buffer Finder
  "   3. Git Command
  "   4. cscope maps, depend on command cscope
  call vam#ActivateAddons( [ 'L9' , 
        \ 'FuzzyFinder'        , 
        \ 'git-vim'            , 
        \ 'cscope_macros' ]    , {'auto_install' : 0})
  " }}}

  "  III. syntax plugin"{{{2
  "   1. assistant function prototype tips
  call vam#ActivateAddons( [ 'assistant'   ]   , {'auto_install':0})
  " 2}}}

  " IV. Diagram  {{{2
  "   1. DrawIt
  call vam#ActivateAddons( [ 'DrawIt' ]   , {'auto_install':0})
  " 2}}}
  "
  " catch /.*/
  "  echoe v:exception
  " endtry
endf
" 1}}}

call SetupVAM()
" experimental: run after gui has been started (gvim) [3]
" option1:  au VimEnter * call SetupVAM()
" option2:  au GUIEnter * call SetupVAM()
" See BUGS sections below [*]

" vim:set fdm=marker ft=vim sw=2 sts=2 et:

