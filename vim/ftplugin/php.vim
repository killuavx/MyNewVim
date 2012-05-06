"PHP语法检查 "{{{
map <F4> :!php-cgi -l %<CR> 
function! CheckSyntaxPHP() 
    setlocal makeprg=php-cgi\ -l\ -n\ -d\ html_errors=off 
    setlocal shellpipe=> 
    " Use error format for parsing PHP error output 
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l 
    make %
endfunction
" Perform :PHP_CheckSyntax() "}}}

let php_folding=1
call vam#ActivateAddons( [ 'XDebug_DBGp_client_for_PHP' ]   , {'auto_install':0})
let g:debuggerMiniBufExpl = 1
let g:debuggerMaxDepth = 10
let g:debuggerMaxChildren = 64
let g:debuggerPort = 9001
