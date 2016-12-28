set nocompatible   "关闭兼容模式,使用插件
filetype on       "开启自动检测文件类型,当碰到陌生文件时,set filetype=python
filetype plugin indent on
set rtp+=~/.vim/bundle/vundle/   "指定vundle的位置,根据.vim的安装位置决定,上面我安装在~/下
call vundle#rc()    "支持一些指令,比如插件安装Bundle指令"
set number       "启用行数
"set cursorline  "添加下划线到当前选中行   
set backspace=2 "解决backspace左移问题

set ignorecase "搜索忽略大小写
set showcmd    "显示当前命令

set mouse=a
set mousehide               " Hide the mouse cursor while typing

set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    "在vim命令栏显示补全列表
set wildmode=list:longest,full  "使用Tab列出补全列表和列表的定义
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolloff=3                 "当距离上面或者下面x行时,自动翻页
set scrolljump=5                "自动翻x页

syntax enable "开启语法高亮
syntax on

"在vim中自动对齐为Normal模式下输入gg=G

"##########包管理插件##########
Bundle 'gmarik/vundle' 
"这个不要清除掉

"##########自动补全##########
Bundle 'Valloric/YouCompleteMe'

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

set completeopt=longest,menu    "去掉经常弹出的preview菜单

inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

let g:ycm_show_diagnostics_ui = 0 "是否启动语法错误检查"
"let g:ycm_error_symbol='>>'   "错误标识符
"let g:ycm_warning_symbol='>*' "警告标识符

"enable completion from tags
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1 "默认开启自动补全,为0就是关闭"
let g:ycm_key_invoke_completion = '<C-a>' "ycm并不支持直接补全所有可能,因为那样做比较耗费性能,只会在.或者->才会搜索全局补全代码,或者就是按下这里设定的按键来搜索全局补全,尤其对C函数只能通过这样补全新的头文件里的函数名,现在设定的为control+a手动开启全局补全,然后自动全局补全的配置在下面两行semantic_triggers的设定
let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.c = ['re!(?=[a-zA-Z0-9_]{3})'] "相当于当输入字符为a-zA-Z0-9,输入第3个字符时启用全局补全
"下面是不同语言的版本
let g:ycm_semantic_triggers.cpp = ['re!(?=[a-zA-Z0-9_]{3})'] 
let g:ycm_semantic_triggers.objc = ['re!(?=[a-zA-Z0-9_]{3})']


"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_collect_identifiers_from_tags_files=1    " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2    " 从第2个键入字符开始提供自动补全


"##########代码配色##########
Bundle 'spf13/vim-colors'
"原本喜欢snf13内置的ir_black
"但是后来发现还是自己配色方便

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

highlight clear SignColumn      "SignColumn should match background

"##########附加自定义代码配色##########

"term为字体 ctermfg为字体颜色 ctermbg为背景颜色 highlight指令查看颜色设定

"Comment        注释  
"Constant       常量  
"statement      常用关键字标示符  
"PrePoc         预处理符号  
"Type           数据类型  

"String          字符串常量: "string abc\n"  
"Character       单个字符常量: 'c', '\n'  
"Number          数字常量: 234, 0xff  
"Boolean         布尔常量: TRUE, false  
"Function        函数名  
"Conditional     条件关键字: if, then, else, endif, switch, etc.  
"Repeat          循环关键字: for, do, while, etc.  
"Operator        操作符: "sizeof", "+", "*", etc.  
"Exception       异常关键字: try, catch, throw  

"Cursor        光标下的字符颜色    
"CursorLine    光标所在行颜色    
"ErrorMsg      命令行出现的错误信息提示    
"IncSearcg     被搜索字符的颜色    
"Normal        普通字符    
"Pmenu         弹出的提示条目颜色    
"PmenuSel      弹出的提示条目中被选中条目的颜色    
"SpellBad      拼写错误字符颜色    
"Visual        可视化模式下选中字符的颜色    
"Menu          菜单栏的颜色字体    
"Scrollbar     滚动条的颜色   

"            0       0       Black
"            1       4       DarkBlue
"            2       2       DarkGreen
"            3       6       DarkCyan
"            4       1       DarkRed
"            5       5       DarkMagenta
"            6       3       Brown, DarkYellow
"            7       7       LightGray, LightGrey, Gray, Grey
"            8       0*      DarkGray, DarkGrey
"            9       4*      Blue, LightBlue
"            10      2*      Green, LightGreen
"            11      6*      Cyan, LightCyan
"            12      1*      Red, LightRed
"            13      5*      Magenta, LightMagenta
"            14      3*      Yellow, LightYellow
"            15      7*      White  

highlight clear Statement 
highlight Comment term=bold ctermfg=248
highlight PreProc ctermfg=brown
highlight Macro ctermfg=brown
highlight String ctermfg= White
highlight Conditional ctermfg=13
highlight Normal ctermfg=green
highlight LineNr term=underline ctermfg=242
highlight Type ctermfg=red
highlight Operator ctermfg=DarkMagenta
highlight Number ctermfg=LightBlue
highlight ErrorMsg ctermfg=red  "上面已经去掉自动检测后,不会在vim里再报错了
highlight Pmenu ctermfg=White ctermbg=DarkGrey "自动补全菜单

"##########增加选择框##########
Bundle 'gcmt/wildfire.vim'

"##########增加底下的状态栏和顶上的页面切换条##########
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'powerline/fonts'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

set laststatus=2

"##########显示所有的撤销操作##########
Bundle 'mbbill/undotree'

"##########快速搜索和跳转##########
Bundle 'easymotion/vim-easymotion'

let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
"重复上一次操作
map <Leader><leader>. <Plug>(easymotion-repeat)

"##########括号的自动填充##########
Bundle 'jiangmiao/auto-pairs'