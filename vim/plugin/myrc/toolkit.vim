
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
 
func! GetVisual() " 获取可视模式下选择的文本 {{{
	let firstcol= col("'<")
	let lastcol= col("'>")
	let firstline = line("'<")
	let lastline = line("'>")
	let str = ''
	if firstline == lastline 
		let ll  = getline(firstline)
		let str = strpart(ll,firstcol-1,lastcol-firstcol)
	else
		let lcount = firstline+1
		let lines = []
		let ll  = strpart(getline(firstline),firstcol-1)
		call add(lines,ll)
		while lcount < lastline
			let ll = getline(lcount)
			call add(lines,ll)
			let lcount += 1
		endw
		let ll = strpart(getline(lcount),0,lastcol-1)
		call add(lines,ll)
		let str = join(lines,"\n")
	endif
	return str
endfunc
"}}}


" 启用cscope {{{1
fun! DoCsTag( prepath )

	 if ( !filereadable( a:prepath . '/cscope.out') )
			silent! execute "!find " . a:prepath . "/ -name '*.php' -type f > " . a:prepath . "/cscope.files"
   endif

	 if ( executable('cscope') && has('cscope') && !filereadable(a:prepath ."/cscope.out") )
      silent! execute "!cscope -bkq -i " . a:prepath . "/cscope.files -f " . a:prepath . "/cscope.out"
	 endif
	 if ( filereadable( a:prepath . '/cscope.out') )
			execute "cs add ".  a:prepath . "/cscope.out " . a:prepath
	 endif
endf
command! -nargs=1 DoCsTag :call DoCsTag(<f-args>)
"}}}
"
map <leader>at :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" 启用tag {{{1
fun! DoTag( prepath )
   let p = expand('pwd')
   silent! execute "cd " . a:prepath
	 if ( !filereadable( a:prepath . '/tags') )
			silent! execute "!ctags -R --c++-kinds=+px --fields=+iaS --extra=+q " . a:prepath . "/" 
   endif
   execute "set tags+=" . a:prepath . "/tags"
   silent! execute "cd " . p
endf
"}}}
command! -nargs=1 DoTag :call DoTag(<f-args>)

" Project Config: ctag,cscope {{{
"}}}
"
"" Calendar diaryVGC {{{1
"fun! DoDiaryVGC( user , pwd )
"   if !exists("g:diaryvgc_bin_exec")  
"      let g:diaryvgc_bin_exec='~/codeware/DiaryVGC_1.4/diaryvgc.py' 
"   endif
"   if ( !filereadable( g:diaryvgc_bin_exec ) || !executable( g:diaryvgc_bin_exec ) ) 
"      return 
"   endif
"   if !exists("g:diaryvgc_log_path") 
"      let g:diaryvgc_log_path='~/diary' 
"   endif
"   execute "!" . g:diaryvgc_bin_exec . " -d=" . g:diaryvgc_log_path . " -u=" . a:user . " -p=" . a:pwd
"endf
"command! -nargs=2 DoDiaryVGC :call DoDiaryVGC(<f-args>)
"}}}

let g:myproject_path      = ''
let g:myproject_test_path = ''
let g:phpunit_args        = '--bootstrap ' . g:myproject_path . g:myproject_test_path . 'bootstrap.php'
let g:phpunit_args        = g:phpunit_args .' --configuration ' . g:myproject_path . g:myproject_test_path . 'phpunit.xml'
let g:phpunit_args        = g:phpunit_args .' --syntax-check'

" vim:ft=vim:fdm=marker:set foldenable:foldclose=all
