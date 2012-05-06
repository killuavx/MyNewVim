" 设置默认文件平台格式
"autocmd BufNewFile,Bufread * set fileformat=unix
" 设置参考线
autocmd BufNewFile,Bufread,BufEnter * set cc=80

" 文件类型检查 
autocmd BufRead,BufNewFile /etc/nginx/* set ft=nginx
autocmd BufRead,BufNewFile *.qml set ft=qml


autocmd BufRead,BufNewFile *.wiki set ft=wiki
autocmd BufRead,BufNewFile *.org set ft=org
