"======= General settings ======"
set nocompatible              " be iMproved, required
filetype off                  " required

" source file to store keybindings
source ~/.vim/keybindings.vim

"======= Vundle settings ======="
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" source file to store bundles
source ~/.vim/plugins.vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"========== PEP8 settings ============"
set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

"autocmd BufWritePost *.py call Pyflakes()
"autocmd BufWritePost *.py call Pep8()

" Pyflakes
let g:PyFlakeOnWrite = 0
let g:PyFlakeCheckers = 'pep8,mccabe,frosted'
let g:PyFlakeDefaultComplexity=10
let g:PyFlakeAggressive = 3
let g:PyFlakeRangeCommand = 'Q'
let g:PyFlakeDefaultComplexity=10

"====== NerdTree ==========="
" to open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree "
" to open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
"Show hidden files
let NERDTreeShowHidden=1
"
"====== vim-airline========="
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Color scheme
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:rehash256 = 1
set t_Co=256
colorscheme solarized
highlight Comment cterm=bold

