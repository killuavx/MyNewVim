fun! SetupVAM() " {{{1
  set runtimepath+=~/vim-addons/vim-addon-manager " commenting try .. endtry because trace is lost if you use it.
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
  "   7. surround
  "   8. YankRing 
  "   9. mru 
  "   10. renamer 
  "   11. Indent_Guides
  call vam#ActivateAddons( [ 'VisIncr' , 
        \ 'Align%294'          , 
        \ 'The_NERD_Commenter' , 
        \ 'DoxygenToolkit'     , 
        \ 'snipmate' ,  'snipmate-snippets' ,
        \ 'Mark%2666',
        \ 'surround' ,
        \ 'Indent_Guides' ,
        \ 'YankRing' ,
        \ 'mru' ,
        \ 'renamer' ,
        \ 'vim-refact' ] , {'auto_install':0})
  " }}}

  " II. View Window OR Exploder {{{2
  "   1. NERD_tree , File Exploder
  "   2. taglist
  "   3. TaskList TODO list
  "   4. Marks Browser
  "   5. WinManager
  "   6. ConqueTerm
  "   7. calendar%52
  "   8. vimwiki
  "   9. Powerline
  call vam#ActivateAddons( [ 'The_NERD_tree', 'NERD_tree_Project',
        \ 'taglist'         , 
        \ 'TaskList'        , 
        \ 'bufexplorer.zip' , 
        \ 'Marks_Browser'   , 
        \ 'winmanager%1440' , 
        \ 'Conque_Shell'    , 
        \ 'calendar%52'     , 
        \ 'vimwiki'     , 
        \ 'Powerline'       , 
        \ 'minibufexpl'  ]   , {'auto_install':0})
  " }}}

  " III. Navigate {{{2
  "   1. L9, Be Depended By FuzzyFinder
  "   2. FuzzyFinder File,Buffer Finder
  "   3. 1 Git Command 'git-vim'            , 
  "      2 Fugitive Git Command 'fugitive', 
  "   4. cscope maps, depend on command cscope
  call vam#ActivateAddons( [ 'L9' , 
        \ 'FuzzyFinder'        , 
        \ 'fugitive'            , 
        \ 'cscope_macros' ]    , {'auto_install' : 0})
  " }}}

  "  III. Syntax Plugin"{{{2
  "   1. assistant function prototype tips
  "   2. Syntastic check 
  call vam#ActivateAddons( [ 'assistant' , 
        \ 'Syntastic' ]   , {'auto_install':0})
  " 2}}}

  " IV. Diagram  {{{2
  "   1. DrawIt
  call vam#ActivateAddons( [ 'DrawIt' ]   , {'auto_install':0})
  " 2}}}

  "  V. Color  {{{2
  "   1. Color_Sampler_Pack: Many Color
  "   2. Color_Scheme_Explorer: Color Scheme Explorer
  call vam#ActivateAddons( [  'Color_Sampler_Pack',
        \ 'Color_Scheme_Explorer' ]   , {'auto_install':0})
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
"
set cscopequickfix=s-,c-,d-,i-,t-,e-


map <Leader>hon :%!xxd<CR>
map <Leader>hof :%!xxd -r<CR>

"au GUIEnter * :NERDTreeFromBookmark openapi
"au GUIEnter * :VimwikiDiaryIndex
"au GUIEnter * :Calendar
" vim:fdm=marker:ft=vim:sw=2:sts=2:et
