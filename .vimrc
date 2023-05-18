" I don't use this much, but it's nice to have. The Neovim configutration 
" is what I actually use.


" From the default.vim file
set nocompatible
set backspace=indent,eol,start
set ruler
set history=500
set tabstop=4
set showcmd
set wildmenu
set display=truncate
set scrolloff=8
autocmd BufReadPost *
	\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	\ |   exe "normal! g`\""
	\ | endif
syntax on
" End of default.vim extract

" Begin extract from vimrc_example.vim
set hlsearch
packadd! matchit
" End of vimrc_example.vim extract


" Personal preferences
set number
set relativenumber
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set breakindent
set formatoptions=l
set lbr

" Custom commands
"" Save as root with "w!!"
cmap w!! w !sudo tee % >/dev/null

" Keybindings
"" Center view while scrolling
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nmap æ $
nmap ø ^
omap æ $
omap ø ^

set nobackup
set nowritebackup
set updatetime=300

