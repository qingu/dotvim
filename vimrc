"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Author:Qingu Jiang
"Date:2013/2/2
"Ref:http://www.cnblogs.com/ma6174/archive/2011/12/10/2283393.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Basic configure
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible    "该设置需要放在下一设置前，不然下一设置无效"
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
set nu              "显示行号
set go=             "不要图形按钮
color desert        " 设置背景主题

if has("win32")
     set guifont=Courier_New:h10:cANSI   " 设置字体
else
     set guifont=Monospace\ 11
endif

"set tw=78 fo+=Mm "自动换行"
"winpos 5 5          " 设定窗口位置 
"set lines=40 columns=155    " 设定窗口大小
syntax on           " 语法高亮 
"autocmd InsertLeave * se nocul  " 用浅色高亮当前行
"autocmd InsertEnter * se cul    " 用浅色高亮当前行
"set ruler           " 显示标尺

set showcmd         " 输入的命令显示出来，看的清楚些
"set cmdheight=1    " 命令行（在状态行下）的高度，设置为1
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容 
"set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限(为什么它和shortmess设置冲突)

"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936      "fileencodings文件编码
"set termencoding=utf-8                                          "终>端编码
"set encoding=utf-8
"set fileencodings=ucs-bom,utf-8,cp936
"set fileencoding=utf-8
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"新建.c,.h,.sh,.py,.java文件，自动插入文件头 

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.java exec ":call SetTitle()"
"定义函数SetTitle，自动插入文件头 

function! SetTitle()

    "如果文件类型为.sh文件 

    if &filetype == 'sh'

        call setline(1,              "\#########################################################################")
        call append(line("."),   "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: Qingu Jiang")
        call append(line(".")+2, "\# mail: jiangqingu@gmail.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")

    elseif &filetype == 'python'

        call setline(1,          "\#########################################################################")
        call append(line("."),   "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: Qingu Jiang")
        call append(line(".")+2, "\# mail: jiangqingu@gmail.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/python")
        call append(line(".")+6, "")

    else

        call setline(1,"/*************************************************************************")
        call append(line("."),   "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: Qingu Jiang")
        call append(line(".")+2, "    > Mail: jiangqingu@gmail.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif

    if &filetype == 'cpp'

        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")

    endif

    if &filetype == 'c'

        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")

    endif

    "新建文件后，自动定位到文件末尾

    autocmd BufNewFile * normal G

endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""                                 
nnoremap <F2> :g/^\s*$/d<CR>                 "F2去空行

nnoremap <C-F2> :vert diffsplit              "Ctrl-F2 比较文件

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y


"fast saving, <leader> default key = '\'
let mapleader="," "set <leader> key = ','

nmap <leader>w :w<cr>

nmap <leader>q :q!<cr>

"press ,ev to open .vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>

"nmap <leader>f :find<cr>

"press ,ev to open .vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>

"press ,sv to reload .vimrc file
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"press ,e to open file in new tab label
nmap  <leader>e :tabe<Space>

"press ,r to open file in new tab label
nmap <leader>r :e<Space>

"press ,p to exec python script
nmap <leader>p :!python %<CR>

map <M-F2> :tabnew<CR>                       "Alt-F2 新建标签

map <F3> :tabnew .<CR>                       "F3 列出当前目录文件

map <C-F3> \be                               "Ctrl-F3 打开树状文件目>录

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"程序编译、运行及调试
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"C，C++ 按F5编译运行

map <F5> :call CompileRunGcc()<CR>
map <F6> :call RunGcc()<CR>

func! CompileRunGcc()

    exec "w"

    if &filetype == 'c'
        exec "!g++ % -o %<"

        exec "! ./%<"

    elseif &filetype == 'cpp'

        exec "!g++ % -o %<"

        exec "! ./%<"

    elseif &filetype == 'fortran'

        exec "!gfortran % -g -o %<.exe"

                "exec "!%<.exe"

                                                  
    elseif &filetype == 'java'

        exec "!javac %"

        exec "!java %<"

    elseif &filetype == 'sh'

        :!./%

    elseif &filetype == 'python'

        ":!./%
                exec "!python %"

    endif
endfunc

func! RunGcc()
        if &filetype == 'fortran'
                exec "!%<.exe"
        endif
endfunc


"C,C++的调试

map <F8> :call Rungdb()<CR>

func! Rungdb()

    exec "w"
                                                  
    exec "!g++ % -g -o %<"

    exec "!gdb ./%<"

endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置当文件被改动时自动载入
set autoread

" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

"代码补全 
set completeopt=preview,menu

"允许插件  
filetype plugin on

"共享剪贴板  
set clipboard+=unnamed

"从不备份  
"set nobackup
"make 运行
:set makeprg=g++\ -Wall\ \ %

"自动保存
set autowrite

set ruler                   " 打开状态栏标尺

set cursorline              " 突出显示当前行

set magic                   " 设置魔术

"set guioptions-=T           " 隐藏工具栏

"set guioptions-=m           " 隐藏菜单栏
                                 
" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 自动缩进
set autoindent
set cindent

" Tab键的宽度
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab

" 历史记录数
set history=1000

"禁止生成临时文件
set nobackup
set noswapfile

"搜索忽略大小写
set ignorecase

"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault

"标尺功能"
set cc=80

"当前光标下列高亮"
"set cuc

"编码设置
""set enc=utf-8
""set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"Vundle设置
if has("win32")
        set rtp+=$VIM/vimfiles/bundle/vundle/
else
        set rtp+=~/.vim/bundle/vundle/
endif
call vundle#rc()

"let Vundle manage Vundle
Bundle 'gmarik/vundle'

"vim-scripts repos
"文件搜索插件
Bundle 'ctrlp.vim'
"自动补全配对符号，如()"
Bundle 'AutoClose'
"自动检测文件编码"
Bundle 'FencView.vim'
"vim编辑窗口树状显示文件目录"
Bundle 'The-NERD-tree'
"代码注释，选中，‘ctrl+h’ 即可注释多种语言代码"
Bundle 'The-NERD-Commenter'

"Bundle 'Tabular'

Bundle 'plasticboy/vim-markdown'
"垂直对齐线"
Bundle 'Yggdroot/indentLine'

Bundle 'Indent-Guides'

Bundle 'snipMate'

Bundle 'taglist.vim'

 " Brief help
 "" :BundleList          - list configured bundles
 "" :BundleInstall(!)    - install(update) bundles
 "" :BundleSearch(!) foo - search(or refresh cache first) for foo
 "" :BundleClean(!)      - confirm(or auto-approve) removal of unused
 "  bundles
 ""
 "" see :h vundle for more details or wiki for FAQ
 "" NOTE: comments after Bundle command are not allowed..


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"插件设置"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctrlp.vim"
"usage: Ctrl+P,输入要打开的文件名，文件名一部分或路径
"ref：http://williamherry.com/blog/2012/08/25/master-vim-04-ctrlp/
noremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
"NERD-Tree"
"usage: F2打开插件，o 打开关闭文件或者目录 t 在标签页中打开 T
"在后台标签页中打开 ! 执行此文件 p 到上层目录 P 到根目录 K 到第一个节
"点 J
"到最后一个节点 u 打开上层目录 m 显示文件系统菜单（添加、删除、移动操
"作） ?
"帮助 q 关闭
"ref:http://williamherry.com/blog/2012/07/19/master-vim-02-nerdtree/
nmap <F2> :NERDTreeToggle <CR>
let NERDTreeMinimalUI=1
let NERDChristmasTree=1

"NERDCommenter"
"usage: 需要打开 filetype plugin on，依靠文件类型选择注释符
"n\cc : 为光标以下 n 行添加注释
"n\cu : 为光标以下 n 行取消注释
"n\cm : 为光标以下 n 行添加块注释
"其中 \ 是Vim 默认的 <leader> 值，可通过在 .vimrc 文件中添加   nmap ,cc
"<leader>cc  =  修改映射为 , 键。就可使用   n,cc   n,cu  n,cm
"快捷键设置注释了。

"FencView"
"usage:首先输入
":FencAutoDectect自动检测，然后就可以:FencView查看自动检测到的字符集>是什么了
":F然后直接tab按键就可以了,不用全部输入

"Markdown"
"关掉折叠功能
let g:vim_markdown_folding_disabled=1
"重复输入:FencView视窗在'关闭/打开'之间切换
"intentLine"
"let g:indentLine_char = '|'
let g:indentLine_color_gui = '#006600'

"Indent-guides"
let g:indent_guides_guide_size=1

"snipMate
""let g:snippets_dir='home/metman/.vim/bundle/'

"taglist.vim
"open/close taglist window"
map <silent><leader>tl :TlistToggle<CR>
"set path to ctags
let Tlist_Ctags_Cmd='/usr/bin/ctags'  
"Only show the current file's tags
let Tlist_Show_One_File=1
"Exit when only the taglist window exists
let Tlist_Exit_OnlyWindow=1
"use the right window for taglist
let Tlist_Use_Right_Window=1
let Tlist_GainFocus_On_ToggleOpen=1
