
" insert mode hjkl
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

" insert mode word cursor move
imap <C-f> <C-Right>
imap <C-b> <C-Left>
imap <C-a> <Home>
imap <C-e> <End>

map <C-a> <Home>
map <C-e> <End>


" commend mode cursor move
cmap <C-a> <Home>
cmap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-x> <Backspace>
imap <C-d> <Del>
"个数imap <C-x> <Backspace>
"
" tabpreview and tabnext map
noremap <C-p> <C-PageUp>
noremap <C-n> <C-PageDown>

map ;; <ESC>
imap ,, <ESC>:w<CR>
map ,, <ESC>:w<CR>

nmap <Tab> v>
nmap <S-Tab> v<
"可视模式下的tab缩进
vmap <Tab> >gv
vmap <S-Tab> <gv

imap {<CR> {<CR>}<Up><End><CR>

" vim:set ft=vim fdm=marker 
