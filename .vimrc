if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'scrooloose/syntastic'
Plug 'junegunn/seoul256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'python-mode/python-mode'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'davidhalter/jedi-vim'
Plug 'moorereason/vim-markdownfmt'
Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Colorscheme
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" Python 3 syntax
let g:pymode_python = 'python3'

" PEP* settings
set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

autocmd BufWritePost *.py call Pyflakes()
autocmd BufWritePost *.py call Pep8()

" Pyflakes
let g:PyFlakeOnWrite = 0
let g:PyFlakeCheckers = 'pep8,mccabe,frosted'
let g:PyFlakeDefaultComplexity=10
let g:PyFlakeAggressive = 3
let g:PyFlakeRangeCommand = 'Q'
let g:PyFlakeDefaultComplexity=10

" NerdTree
" to open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree "
" to open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" NERDTree Arrows
let g:NERDTreeDirArrowExpandable = "+"
let g:NERDTreeDirArrowCollapsible = "~"
"Show hidden files
let NERDTreeShowHidden=1
"
" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Colorscheme settings
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:rehash256 = 1
set t_Co=256
colorscheme solarized
highlight Comment cterm=bold

" Hotkeys
" Nerdtree shortcut
map <C-f> :NERDTreeTabsToggle<CR>
" check python code via PEP8 <leader>8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>
"
" autocomplete <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

" syntax change
nnoremap <leader>Th :set ft=htmljinja<CR>
nnoremap <leader>Tp :set ft=python<CR>
nnoremap <leader>Tj :set ft=javascript<CR>
nnoremap <leader>Tc :set ft=css<CR>
nnoremap <leader>Td :set ft=django<CR>

" Tagbar
nmap <C-t> :TagbarToggle<CR>

"Tabs mapping
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

