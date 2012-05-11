"PHP语法检查 "{{{
function! CheckSyntaxPHP() 
    setlocal makeprg=php-cgi\ -l\ -n\ -d\ html_errors=off 
    setlocal shellpipe=> 
    " Use error format for parsing PHP error output 
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l 
    make %
endfunction
map <silent> <F4> :call CheckSyntaxPHP()<CR>
" Perform :PHP_CheckSyntax() "}}}

let php_folding=1
call vam#ActivateAddons( [ 'XDebug_DBGp_client_for_PHP' ]   , {'auto_install':0})
let g:debuggerMiniBufExpl = 1
let g:debuggerMaxDepth = 10
let g:debuggerMaxChildren = 64
let g:debuggerPort = 9001

set dictionary=~/.vim/ftplugin/php/doc
set complete+=k~/.vim/ftplugin/php/doc "add dictionary complete
set runtimepath+=~/.vim/ftplugin/php/doc
set runtimepath+=~/.vim/ftplugin/php/
autocmd BufNewFile,Bufread *.php set keywordprg="help"


function! RunPhpcs()
    let l:filename=@%
    let l:phpcs_output=system('phpcs --report=csv --standard=YMC '.l:filename)
"    echo l:phpcs_output
    let l:phpcs_list=split(l:phpcs_output, "\n")
    unlet l:phpcs_list[0]
    cexpr l:phpcs_list
    cwindow
endfunction

set errorformat+=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\"
command! Phpcs execute RunPhpcs()
