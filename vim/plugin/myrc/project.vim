
let g:myproject_path      = '/var/www/platform_common/'
let g:myproject_test_path = 'protected/tests/'
let g:phpunit_args        = '--bootstrap ' . g:myproject_path . g:myproject_test_path . 'bootstrap.php'
let g:phpunit_args        = g:phpunit_args .' --configuration ' . g:myproject_path . g:myproject_test_path . 'phpunit.xml'
let g:phpunit_args        = g:phpunit_args .' --syntax-check'
nmap  <C-\> :!dict "<cword>" <C-R>=expand("<cword>")<CR><CR>
