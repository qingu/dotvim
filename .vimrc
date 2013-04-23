""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Author:Qingu Jiang
"Date:2013/2/2
"Ref:http://www.cnblogs.com/ma6174/archive/2011/12/10/2283393.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Basic configure
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible    "��������Ҫ������һ����ǰ����Ȼ��һ������Ч"
set shortmess=atI   " ������ʱ����ʾ�Ǹ�Ԯ���ڸɴ��ͯ����ʾ  
set nu              "��ʾ�к�
set go=             "��Ҫͼ�ΰ�ť
color desert        " ���ñ�������
"set guifont=Courier_New:h10:cANSI   " ��������
set guifont=Monospace\ 11
"winpos 5 5          " �趨����λ�� 
"set lines=40 columns=155    " �趨���ڴ�С
syntax on           " �﷨���� 
"autocmd InsertLeave * se nocul  " ��ǳɫ������ǰ��
"autocmd InsertEnter * se cul    " ��ǳɫ������ǰ��
"set ruler           " ��ʾ���
set showcmd         " �����������ʾ�������������Щ
"set cmdheight=1    " �����У���״̬���£��ĸ߶ȣ�����Ϊ1
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "״̬����ʾ������ 
"set nocompatible  "ȥ��������й�viһ����ģʽ��������ǰ�汾��һЩbug�;���(Ϊʲô����shortmess���ó�ͻ)

"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936      "fileencodings�ļ�����
"set termencoding=utf-8                                          "�ն˱���
"set encoding=utf-8
"set fileencodings=ucs-bom,utf-8,cp936
"set fileencoding=utf-8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""���ļ�����"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"�½�.c,.h,.sh,.py,.java�ļ����Զ������ļ�ͷ 

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.java exec ":call SetTitle()" 

""���庯��SetTitle���Զ������ļ�ͷ 

func SetTitle() 

    "����ļ�����Ϊ.sh�ļ� 

    if &filetype == 'sh' 

        call setline(1,"\#########################################################################") 

        call append(line("."), "\# File Name: ".expand("%")) 

        call append(line(".")+1, "\# Author: Qingu Jiang") 

        call append(line(".")+2, "\# mail: jiangqingu@gmail.com") 

        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 

        call append(line(".")+4, "\#########################################################################") 

        call append(line(".")+5, "\#!/bin/bash") 

        call append(line(".")+6, "") 
        
    elseif &filetype == 'python'
    
        call setline(1,"\#########################################################################") 

        call append(line("."), "\# File Name: ".expand("%")) 

        call append(line(".")+1, "\# Author: Qingu Jiang") 

        call append(line(".")+2, "\# mail: jiangqingu@gmail.com") 

        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 

        call append(line(".")+4, "\#########################################################################") 

        call append(line(".")+5, "\#!/bin/python") 

        call append(line(".")+6, "") 

    else 

        call setline(1, "/*************************************************************************") 

        call append(line("."), "    > File Name: ".expand("%")) 

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

    "�½��ļ����Զ���λ���ļ�ĩβ

    autocmd BufNewFile * normal G

endfunc 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"��������
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  
nnoremap <F2> :g/^\s*$/d<CR>                 "F2ȥ����
 
nnoremap <C-F2> :vert diffsplit              "Ctrl-F2 �Ƚ��ļ� 

" ӳ��ȫѡ+���� ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G

" ѡ��״̬�� Ctrl+c ����
vmap <C-c> "+y

"������������ûŪ��"
"nmap <leader>w :w!<cr>

"nmap <leader>f :find<cr>

map <M-F2> :tabnew<CR>                       "Alt-F2 �½���ǩ  

map <F3> :tabnew .<CR>                       "F3 �г���ǰĿ¼�ļ�

map <C-F3> \be                               "Ctrl-F3 ����״�ļ�Ŀ¼ 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"������롢���м�����
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"C��C++ ��F5��������

map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()

    exec "w"

    if &filetype == 'c'

        exec "!g++ % -o %<"

        exec "! ./%<"

    elseif &filetype == 'cpp'

        exec "!g++ % -o %<"

        exec "! ./%<"

    elseif &filetype == 'java' 

        exec "!javac %" 

        exec "!java %<"

    elseif &filetype == 'sh'

        :!./%
        
    elseif &filetype == 'python'
    
        :!./%

    endif

endfunc


"C,C++�ĵ���

map <F8> :call Rungdb()<CR>

func! Rungdb()

    exec "w"

    exec "!g++ % -g -o %<"

    exec "!gdb ./%<"

endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""ʵ������

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ���õ��ļ����Ķ�ʱ�Զ�����
set autoread

" quickfixģʽ
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

"���벹ȫ 
set completeopt=preview,menu 

"������  
filetype plugin on

"���������  
set clipboard+=unnamed 

"�Ӳ�����  
"set nobackup

"make ����
:set makeprg=g++\ -Wall\ \ %

"�Զ�����
set autowrite

set ruler                   " ��״̬�����

set cursorline              " ͻ����ʾ��ǰ��

set magic                   " ����ħ��

"set guioptions-=T           " ���ع�����

"set guioptions-=m           " ���ز˵���

" �ڴ���δ�����ֻ���ļ���ʱ�򣬵���ȷ��
set confirm

" �Զ�����
set autoindent
set cindent

" Tab���Ŀ��
set tabstop=4

" ͳһ����Ϊ4
set softtabstop=4
set shiftwidth=4

" ��Ҫ�ÿո�����Ʊ��
set noexpandtab

" ���кͶο�ʼ��ʹ���Ʊ��
set smarttab

" ��ʷ��¼��
set history=1000

"��ֹ������ʱ�ļ�
set nobackup
set noswapfile

"�������Դ�Сд
set ignorecase

"�������ַ�����
set hlsearch
set incsearch

"�����滻
set gdefault

"��������
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"��������
"set langmenu=zh_CN.UTF-8
"set helplang=cn

" ����ļ�����
" ΪVundle������ã�why
"filetype on

" �����ļ����Ͳ��

"filetype plugin on

" Ϊ�ض��ļ�����������������ļ�

"filetype indent on

"Vundle����
"set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle
Bundle 'gmarik/vundle'

"vim-scripts repos
"�ļ��������
Bundle 'ctrlp.vim'
"�Զ���ȫ��Է��ţ���()"
Bundle 'AutoClose'
"�Զ�����ļ�����"
Bundle 'FencView.vim'
"vim�༭������״��ʾ�ļ�Ŀ¼"
Bundle 'The-NERD-tree'
"����ע�ͣ�ѡ�У���ctrl+h�� ����ע�Ͷ������Դ���"
Bundle 'The-NERD-Commenter'

Bundle 'Tabular'

filetype plugin indent on


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
"�������"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctrlp.vim"
"usage: Ctrl+P,����Ҫ�򿪵��ļ������ļ���һ���ֻ�·��
"ref��http://williamherry.com/blog/2012/08/25/master-vim-04-ctrlp/
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
"usage: F2�򿪲����o �򿪹ر��ļ�����Ŀ¼ t �ڱ�ǩҳ�д� T
"�ں�̨��ǩҳ�д� ! ִ�д��ļ� p ���ϲ�Ŀ¼ P ����Ŀ¼ K ����һ���ڵ� J
"�����һ���ڵ� u ���ϲ�Ŀ¼ m ��ʾ�ļ�ϵͳ�˵�����ӡ�ɾ�����ƶ������� ?
"���� q �ر�
"ref:http://williamherry.com/blog/2012/07/19/master-vim-02-nerdtree/
nmap <F2> :NERDTreeToggle <CR>
let NERDTreeMinimalUI=1
let NERDChristmasTree=1

"NERDCommenter"
"usage: ��Ҫ�� filetype plugin on�������ļ�����ѡ��ע�ͷ�
"n\cc : Ϊ������� n �����ע��
"n\cu : Ϊ������� n ��ȡ��ע��
"n\cm : Ϊ������� n ����ӿ�ע��
"���� \ ��Vim Ĭ�ϵ� <leader> ֵ����ͨ���� .vimrc �ļ������   nmap ,cc
"<leader>cc  =  �޸�ӳ��Ϊ , �����Ϳ�ʹ��   n,cc   n,cu  n,cm
"��ݼ�����ע���ˡ�

"FencView"
"usage:��������
":FencAutoDectect�Զ���⣬Ȼ��Ϳ���:FencView�鿴�Զ���⵽���ַ�����ʲô��
":FȻ��ֱ��tab�����Ϳ�����,����ȫ������
"�ظ�����:FencView�Ӵ���'�ر�/��'֮���л�
