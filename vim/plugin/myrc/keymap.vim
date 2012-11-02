
" insert mode hjkl
"imap <C-h> <Left>
"imap <C-j> <Down>
"imap <C-k> <Up>
"imap <C-l> <Right>

imap <M-h> <Left>
imap <M-j> <Down>
imap <M-k> <Up>
imap <M-l> <Right>
imap <M-v> <Esc>v
imap <M-V> <Esc>V

imap <M-o> <Esc>o
imap <M-O> <Esc>O

imap <M-c> <C-o>cw
imap <M-d> <C-o>dd
imap <M-x> <C-o>D

"imap <M->> <C-o>>>
"imap <M->> <C-o><<

" insert mode word cursor move
imap <C-f> <C-Right>
imap <C-b> <C-Left>
imap <C-a> <Home>
imap <C-e> <End>
imap <C-s> <C-o>^

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
noremap <M-p> <C-PageUp>
noremap <M-n> <C-PageDown>
noremap <M-d> :tabc<CR>

imap ;; <ESC>
imap ,, <ESC>:w<CR>
map ,, <ESC>:w<CR>

nmap <Tab> v>
nmap <S-Tab> v<
"可视模式下的tab缩进
vmap <Tab> >gv
vmap <S-Tab> <gv

imap {<CR> {<CR>}<Up><End><CR>

" vim:set ft=vim fdm=marker 
