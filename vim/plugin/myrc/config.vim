
" Config: base {{{
set number
" 语法高亮
syntax on
" 启用文件类型插件，语法缩进
filetype plugin indent on

language C
set guifont=Monaco\ 9
set magic
set nocp

" 在终端和gui下使用鼠标
set mouse=a

set nowrap " 不自动换行
" 设置超过120字符自动换行
"set textwidth=120
""设置超过100列的字符带下划线 "
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>80v.\+', -1)
"syn match out80 /\%80v./ containedin=ALL
"hi out80 guifg=white guibg=red
" 显示尾行空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
"set listchars=tab:\|\ ,trail:-,extends:>,precedes:<
set listchars=extends:>,precedes:<
"显示尾行标示
set list

set nobackup
set nowritebackup
autocmd BufEnter * cd %:p:h " 移动工作目录到当前文件所在目录
"autocmd BufEnter * :call SetFileFormat() " 自动设置文件格式
"fun! SetFileFormat()
"	let bstate = exec "set modifiable?"
"  if bstate == "modifiable"
"     set fileformat=unix
"  endif
"endf
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
"au GUIEnter * colo lucius
"au GUIEnter * colo Tomorrow-Night
"au GUIEnter * colo Mustang_Vim_Colorscheme_by_hcalves
"au GUIEnter * colo wombat
"au GUIEnter * colo jellybeans
"au GUIEnter * colo desertEx
"au GUIEnter * colo tir_black
"au GUIEnter * colo lucius
"au GUIEnter * colo xoria256
au GUIEnter * colo molokai
"
" if has("gui_running")
"   set guioptions-=T
"   set t_Co=256
"   set background=dark
"   colorscheme peaksea
"   set nonu
" else
"   colorscheme zellner
"   set background=dark
"   set nonu
" endif

set guioptions= "去除vim的GUI版本中的toolbar
"}}}

" Config: Edit {{{1
"set spell         " 评写检查
"set cindent       " c缩进
set autoindent    " 设置自动缩进
set tabstop=2     " 空格数量为4
set shiftwidth=2  " 自动缩进为4
set softtabstop=2 " 退格删除2空格
set expandtab     " 使用空格代替Tab
autocmd BufEnter * set expandtab
"set smartindent   " 智能对齐方式
set nosmartindent
set nosmarttab
set showmatch     " 设置匹配模式， 类似当输入一个左括号时匹配右括号
""}}}

" Config: View {{{1
" Add more information on status bar
""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Powerline
let Powerline_symbols = 'compatible'
let g:Powerline_symbols           = 'fancy'
"let g:Powerline_dividers_override = ['>>', '>', '<<', '<']

"Git branch"{{{2
function! GitBranch()
    try
        let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
    catch
        return 'NO GIT'
    endtry

    if branch != ''
        return 'GitBranch:' . substitute(branch, '\n', '', 'g') 
    en

    return 'NO GIT'
endfunction

function! CurDir()
    return substitute(getcwd(), '/Users/amir/', "~/", "g")
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Format the statusline
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L%\ %{GitBranch()}
" set statusline=%F%m%r%h%w\ [%{GitBranch()}]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%l,%L]
"}}}

set cmdheight=3 "设置命令行的高度
set cursorline  " 行高亮
set cursorcolumn "列高亮，与函数列表有冲突
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
set fileencodings=utf-8,gbk,big5
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
nnoremap   <leader>fb    :FufBuffer<CR>
nnoremap   <leader>ff    :FufFile<CR>
nnoremap   <leader>fcf   :FufCoverageFile<CR>
nnoremap   <leader>fd    :FufDir<CR>
nnoremap   <leader>fmf   :FufMruFile<CR>
nnoremap   <leader>fmc   :FufMruCmd<CR>
nnoremap   <leader>fbf   :FufBookmarkFile<CR>
nnoremap   <leader>fbd   :FufBookmarkDir<CR>
nnoremap   <leader>ft    :FufTag<CR>
nnoremap   <leader>fbt   :FufBufferTag<CR>
nnoremap   <leader>ftf   :FufTaggedFile<CR>
nnoremap   <leader>fj    :FufJumpList<CR>
nnoremap   <leader>fcl   :FufChangeList<CR>
nnoremap   <leader>fq    :FufQuickfix<CR>
nnoremap   <leader>fl    :FufLine<CR>
nnoremap   <leader>fh    :FufHelp<CR>
"}}}

" Config: winManager & miniBufExpl setting {{{1

let g:winManagerWidth = 30
let g:defaultExplorer = 0
let g:winManagerWindowLayout='TagList|BufExplorer,FileExplorer'
nmap <C-W><C-F> :FirstExplorerWindow<CR>
nmap <C-W><C-B> :BottomExplorerWindow<CR>
nmap <silent> <F8> :WMToggle<CR>

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=1
let g:bufExplorerShowRelativePath=1
"let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim    = 1
let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs  = 0
"let g:miniBufExplModSelTarget       = 1
"let g:miniBufExplorerMoreThanOne    = 0
"let g:miniBufExplModSelTarget       = 0
"let g:miniBufExplUseSingleClick     = 1
"let g:miniBufExplMapWindowNavVim    = 1
"let g:miniBufExplVSplit             = 20
let g:miniBufExplSplitBelow         = 2

" autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>


"}}}

" Config: taglist {{{1
let g:Tlist_Show_One_File=1 "taglist plugin show local tagfile only
"let Tlist_Use_Right_Window=1 "show right
let g:Tlist_Exit_OnlyWindw=1
"让当前不被编辑的文件的方法列表自动折叠起来
let g:Tlist_File_Fold_Auto_Close=0
"let Tlist_Auto_Open=1
let g:Tlist_Auto_Update=1
" }}}

" Config: NERDTree {{{1
let NERDChristmasTree           = 1             " 色彩显示
"let NERDTreeShowHidden         = 1             " 显示隐藏文件
let NERDTreeHighlightCursorline = 1             " 高亮当前行
let NERDTreeShowBookmarks       = 1             " 显示bookmarks
let NERDTreeWinPos              = 'right'       " 窗体位置
let NERDTreeShowLineNumbers     = 1
let NERDTreeKeepTreeInNewTab    = 1                  "
let NERDTreeShowHidden          = 1
nmap <F7> :NERDTreeToggle<CR>
"au VimEnter *  NERDTree                           " 自动打开 NERDTree
" }}}

" Config: Indent Guides {{{1
"let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level =2
let g:indent_guides_guide_size = 1
"hi IndentGuidesOdd  guibg=red   ctermbg=3
"hi IndentGuidesEven guibg=green ctermbg=4 
"}}}

function! ShortTabLabel () " 标签页只显示文件名 {{{1
  let bufnrlist = tabpagebuflist (v:lnum)
  let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
  let filename = fnamemodify (label, ':t')
  return filename
endfunction
" }}}
set guitablabel=%{ShortTabLabel()}

"Session settings"{{{
"------------Session---------------
let g:session_directory=$HOME.'/.vim/tmp/session'
let g:session_autoload='yes'
let g:session_autosave='yes'

" create tmp folder and the subfolders if they don't exist.
function! InitializeDirectories()
   let separator = "."
   let parent = $HOME 
   let prefix = '.vim/tmp/'
   if !isdirectory(parent.'/'.prefix)
      call mkdir(parent.'/'.prefix)
   endif

   let dir_list = { 
            \ 'backup': 'backupdir', 
            \ 'views': 'viewdir', 
            \ 'undo' : 'undodir',
            \ 'swap': 'directory' }

   for [dirname, settingname] in items(dir_list)
      let directory = parent . '/' . prefix . dirname . "/"
      if exists("*mkdir")
         if !isdirectory(directory)
            call mkdir(directory)
         endif
      endif
      if !isdirectory(directory)
         echo "Warning: Unable to create backup directory: " . directory
         echo "Try: mkdir -p " . directory
      else  
         let directory = substitute(directory, " ", "\\\\ ", "")
         exec "set " . settingname . "=" . directory."/"
      endif
   endfor
   "add session folder if it doesn't exist
   if !isdirectory(parent.'/'.prefix.'session/')
      call mkdir(parent.'/'.prefix.'session/')
   endif
endfunction
call InitializeDirectories()
"set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
"set guioptions-=T "去除vim的GUI版本中的toolbar

"autocmd BufLeave *.* silent mkview
"autocmd BufEnter *.* silent loadview"}}}
"
" Config: Marks {{{ 1
nmap <silent> ,hl <Plug>MarkSet
vmap <silent> ,hl <Plug>MarkSet
nmap <silent> ,hh <Plug>MarkClear
vmap <silent> ,hh <Plug>MarkClear
nmap <silent> ,hr <Plug>MarkRegex
vmap <silent> ,hr <Plug>MarkRegex

hi MarkWord1  ctermbg=Cyan     ctermfg=Black  guibg=#8CCBEA    guifg=White
hi MarkWord2  ctermbg=Green    ctermfg=Black  guibg=#A4E57E    guifg=White
hi MarkWord3  ctermbg=Yellow   ctermfg=Black  guibg=#FFDB72    guifg=White
hi MarkWord4  ctermbg=Red      ctermfg=Black  guibg=#FF7272    guifg=White
hi MarkWord5  ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=White
hi MarkWord6  ctermbg=Blue     ctermfg=Black  guibg=#9999FF    guifg=White
"}}}

" Config:Syntastic {{{

let g:syntastic_echo_current_error = 1
let g:syntastic_check_on_open      = 1
let g:syntastic_enable_signs       = 1
let g:syntastic_error_symbol       = '✗' " - For syntax errors, defaults to '>>'
let g:syntastic_warning_symbol     = '⚠' " - For syntax warnings, defaults to '>>'
"let g:syntastic_style_error_symbol   =  " - For style errors, defaults to 'S>'
"let g:syntastic_style_warning_symbol =  " - For style warnings, defaults to 'S>'
let g:syntastic_auto_loc_list      = 0
let g:syntastic_loc_list_height=5
let g:syntastic_disabled_filetypes = ['html']
let g:syntastic_stl_format         = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
let g:syntastic_phpcs_disable      = 1
let g:syntastic_phpcs_conf         = "--tab-width=2 --standard=CodeIgniter"
"let g:syntastic_jsl_conf = '$HOME/.vim/jsl.conf'

" }}}
"
set grepprg=/bin/grep\ -nH
""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
"map <leader>f :MRU<CR>

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>

set ruler "Always show current position

" Set to auto read when a file is changed from the outside
set autoread

let g:phpunit_debug=1
" vim:ft=vim:fdm=marker:tw=78:ts=2:sw=2:expandtab:norl:foldclose=all:foldlevel=0
