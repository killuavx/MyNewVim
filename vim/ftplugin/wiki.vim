call vam#ActivateAddons( [ 'vimwiki' ], {'auto_install':0})
" vimwiki
let g:vimwiki_use_mouse=1
let g:vimwiki_list=[{'path':"~/vim-addons/myvimwiki/",
      \'path_html':'~/.vim/myvimwiki/html/',
      \'html_header':'~/.vim/myvimwiki/header.tpl'}]
