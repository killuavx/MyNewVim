map <leader>at :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

fu! ReferenceLine(t) " [移动参考线] {{{1
  let ccnum = &cc
  if ccnum == '' | let ccnum = 0 | en
  let csw = &sw
  if a:t == 'add'
    let ccnum = ccnum + csw
    exec "setl cc=".ccnum
  elsei a:t == 'cut'
    let ccnum = ccnum - csw
    exec "setl cc=".ccnum
  elsei a:t == 'subtract'
    let ccnum = ccnum - csw
    if ccnum >= 0 | exec "setl cc=".ccnum | en
  en
endf
nn <silent> <C-q> :call ReferenceLine('subtract')<CR>
nn <silent> <C-o> :call ReferenceLine('add')<CR>
nn <silent> <C-u> :call ReferenceLine('cut')<CR>
"}}}

" 行内光标列移动 {{{1
nnoremap <expr> gh '<Esc>' . float2nr( round( (col('$')-1) * min([100, v:count]) / 100.0)) . '<Bar>'
nmap gch 50gh
" }}}

" 查看 svn diff，flw 很得意的创意
function! FlwSvnDiffToggle() " {{{1
  if bufexists( "__SVN_DIFF__" )
    bwipeout __SVN_DIFF__
  else
    if exists("t:flwsvndiff")
      diffoff!
      let l:fileName = t:flwsvndiff
      unlet t:flwsvndiff
      exec "bwipeout " . l:fileName           
    else
      let t:flwsvndiff = expand("%:h") . "/.svn/text-base/" . expand("%:t") . ".svn-base"
      let l:ft = &ft
      exec "silent vert diffsplit " . t:flwsvndiff
      set readonly
      set buftype=nofile
      exec "set ft=" . l:ft
      wincmd p
      autocmd VimResized * :wincmd =
    endif
  endif
endfunction 
" }}}
" F7 察看svn版本比较
nmap <silent> <C-F7> :call FlwSvnDiffToggle()<CR>
nmap <silent> g<C-F7> :new __SVN_DIFF__ <CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg

" 比较未保存文件的差异 {{{ 1
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif
"}}}
"
"
