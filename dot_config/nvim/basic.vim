set t_Co=256					" 256 color support
set mouse=					" disable mouse
set nocompatible				" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start			" more powerful backspacing
set history=50					" keep 50 lines of command line history
set ruler					" show the cursor position all the time
set cursorline
set guicursor=i:block				" 插入模式使用块状光标

" 各种显示中文
set fileencodings=utf-8,gb2312,cs-bom,gb18030,gbk,cp936
set termencoding=utf-8
set encoding=utf-8
set fenc=utf-8
set fileformat=unix				" 自动转码


set nowrap					" 不自动折行
set splitright
set splitbelow

set laststatus=2				" more effective state bar
set statusline+=%t				" tail of the filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}] "encoding and format
set statusline+=\ b:%n
set statusline+=\ %h			" help file flag
set statusline+=%m			" modified flag
set statusline+=%r			" read only flag
set statusline+=%=			" left/right separator
set statusline+=%c,	 		" cursor column
set statusline+=%l/%L			" cursor line/total lines
set statusline+=\ %P			" percent through file

colorscheme default			" 配色方案
set background=light			" for xshell

set hlsearch				" 设置搜索高亮
hi Search	ctermbg=yellow	ctermfg=black
hi DiffAdd	ctermbg=235	ctermfg=108	guibg=#262626 guifg=#87af87 cterm=reverse gui=reverse
hi DiffChange	ctermbg=235	ctermfg=103	guibg=#262626 guifg=#8787af cterm=reverse gui=reverse
hi DiffDelete	ctermbg=235	ctermfg=131	guibg=#262626 guifg=#af5f5f cterm=reverse gui=reverse
hi DiffText	ctermbg=235	ctermfg=208	guibg=#262626 guifg=#ff8700 cterm=reverse gui=reverse

au FileType * set shiftwidth=4
au FileType cpp set shiftwidth=2
