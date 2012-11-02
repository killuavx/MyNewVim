setl fdm=syntax | setl fen 

setlocal tabstop=4     " 空格数量为4
setlocal shiftwidth=4  " 自动缩进为4
setlocal softtabstop=4 " 退格删除2空格
"setlocal expandtab "使用空格代替Tab
setlocal smarttab

setlocal foldmethod=indent
setlocal foldexpr=2

"autocmd FileType php setl fdm=syntax | setl fen 
"let g:pydiction_menu_height = 10
"set complete+=k~/.vim/ftplugin/pydiction
"set omnifunc=pythoncomplete#Complete
"set ofu=syntaxcomplete#Complete
"runtime! $HOME/.vim/autoload/pythoncomplete.vim
map <F4> <ESC>:w<CR>:!pylint %

" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
"let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
"let g:pep8_map='whatever'
"let g:pep8_map='<leader>8'

" au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType python setlocal define=^\s*\\(def\\\\|class\\)
"au FileType python compiler nose
au FileType man nnoremap <buffer> <cr> :q<cr>

" Jesus tapdancing Christ, built-in Python syntax, you couldn't let me
" override this in a normal way, could you?
au FileType python if exists("python_space_error_highlight") | unlet python_space_error_highlight | endif

" Jesus, Python.  Five characters of punctuation for a damn string?
au FileType python inoremap <buffer> <d-'> _(u'')<left><left>
