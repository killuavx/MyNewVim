
" Config: base {{{
set number
" 语法高亮
syntax on
" 启用文件类型插件，语法缩进
filetype plugin indent on

language C
set guifont=Monaco\ 9
set magic

" 在终端和gui下使用鼠标
set mouse=a

set nowrap " 不自动换行
" 设置超过120字符自动换行
"set textwidth=120
"设置超过100列的字符带下划线 "
au BufWinEnter * let w:m2=matchadd('Underlined', '\%>120v.\+', -1)
"syn match out80 /\%80v./ containedin=ALL
"hi out80 guifg=white guibg=red
" 显示尾行空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
set listchars=tab:\|\ ,trail:~,extends:>,precedes:<
"显示尾行标示
set list

set nobackup
set nowritebackup
autocmd BufEnter * cd %:p:h " 移动工作目录到当前文件所在目录
let g:snips_author="Huang Ronghua<huangronghua@ndoo.com>"
"}}}

" Config: 菜单帮助 {{{1
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>
" }}}

" Config: for GUI {{{
"au GUIEnter * simalt ~x "最大化窗口
"au GUIEnter * colo wombat "设置GUI下的颜色主题
"au GUIEnter * colo molkai
au GUIEnter * colo lucius
"au GUIEnter * colo Tomorrow-Night
"au GUIEnter * colo Mustang_Vim_Colorscheme_by_hcalves
"au GUIEnter * colo wombat
"au GUIEnter * colo jellybeans
"au GUIEnter * colo desertEx
"au GUIEnter * colo tir_black
"au GUIEnter * colo lucius
"au GUIEnter * colo xoria256
fun! ColoSelect()
  call complete( col('.'), [ 'wombat' ,
  \'molkai'             ,
  \'Tomorrow-Night'     ,
  \'Mustang_Vim_Colorscheme_by_hcalves',
  \'wombat'            ,
  \'jellybeans'        ,
  \'desertEx'          ,
  \'tir_black'         ,
  \'lucius'            ,
  \'xoria256'])
  return ''
endf
map <F2> <C-R>=ColoSelect()<CR>

"}}}

" Config: Edit {{{1
set spell         " 评写检查
set cindent       " c缩进
set autoindent    " 设置自动缩进
set tabstop=2     " 空格数量为4
set shiftwidth=2  " 自动缩进为4
set softtabstop=2 " 退格删除2空格
set expandtab     " 使用空格代替Tab
set smartindent   " 智能对齐方式
set showmatch     " 设置匹配模式， 类似当输入一个左括号时匹配右括号
""}}}

" Config: View {{{1
" Add more information on status bar
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2
set cmdheight=3 "设置命令行的高度
set cursorline  " 行高亮
"set cursorcolumn "列高亮，与函数列表有冲突
set cc=80 " 列上限参考线
"}}}

" Config: search, case insensitive search"{{{
set hlsearch
set ignorecase
set smartcase
set nowrap "不自动换行
"}}}

" Config: fold 设置折叠模式 {{{1
set foldenable
set foldcolumn=2
"光标遇到折叠，折叠就打开
"set foldopen=all
"移开折叠时自动关闭折叠
"set foldclose=all
"zf zo zc zd zr zm zR zM zn zi zN
"依缩进折叠
"   manual  手工定义折叠
"   indent  更多的缩进表示更高级别的折叠
"   expr    用表达式来定义折叠
"   syntax  用语法高亮来定义折叠
"   diff    对没有更改的文本进行折叠
"   marker  对文中的标志折叠
"set foldmethod=syntax
"启动时不要自动折叠代码
set foldlevel=1
"依标记折叠
set foldmethod=marker
" }}}

" Config: for chinese encode {{{1
set encoding=UTF-8
set termencoding=UTF-8
language message zh_CN.utf-8 "解决终端乱码
set fileencodings=utf-8,gbk,big5,latin1
set fileencoding=utf-8
set ambiwidth=double "显示中文引号
" }}}

" Config: showmarks setting {{{1
let showmarks_enable       = 1 " Enable ShowMarks
let showmarks_include      = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Show which marks
let showmarks_ignore_type  = "hqm"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_hlline_lower = 1 " Hilight lower & upper marks
let showmarks_hlline_upper = 1

" For showmarks plugin
hi ShowMarksHLl ctermbg=Yellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
hi ShowMarksHLu ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=Black
" }}}

" Config: FuzzyFinder {{{1
nnoremap <leader>ff :FufFile<CR>
nnoremap <leader>fb :FufBuffer<CR>
nnoremap <leader>fd :FufDir<CR>
nnoremap <leader>ft :FufTag<CR>
nnoremap <leader>fr :FufFileRecursive<CR>
"}}}

" Config: winManager setting {{{1
let g:winManagerWidth = 30
let g:defaultExplorer = 0
let g:winManagerWindowLayout='TagList|BufExplorer'
let g:miniBufExplMapCTabSwitchBufs=1
nmap <C-W><C-F> :FirstExplorerWindow<CR>
nmap <C-W><C-B> :BottomExplorerWindow<CR>
nmap <silent> <F8> :WMToggle<CR>
"}}}

" Config: taglist {{{1
let g:Tlist_Show_One_File=1 "taglist plugin show local tagfile only
"let Tlist_Use_Right_Window=1 "show right
let g:Tlist_Exit_OnlyWindw=1
"让当前不被编辑的文件的方法列表自动折叠起来
let g:Tlist_File_Fold_Auto_Close=1
"let Tlist_Auto_Open=1
let g:Tlist_Auto_Update=1
" }}}

" Config: NERDTree {{{1
let NERDChristmasTree           = 1             " 色彩显示
"let NERDTreeShowHidden         = 1             " 显示隐藏文件
let NERDTreeHighlightCursorline = 1             " 高亮当前行
let NERDTreeShowBookmarks         = 1             " 显示bookmarks
let NERDTreeWinPos                = 'right'       " 窗体位置
let NERDTreeShowLineNumbers=1
"au VimEnter *  NERDTree                           " 自动打开 NERDTree
" }}}

function! ShortTabLabel () " 标签页只显示文件名 {{{1
  let bufnrlist = tabpagebuflist (v:lnum)
  let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
  let filename = fnamemodify (label, ':t')
  return filename
endfunction
" }}}
set guitablabel=%{ShortTabLabel()}

"Session settings
"set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
set guioptions-=T "去除vim的GUI版本中的toolbar

"autocmd BufLeave *.* silent mkview
"autocmd BufEnter *.* silent loadview
