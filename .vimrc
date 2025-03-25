" =============================================================================
" Vim-Plug Plugin Manager Setup
" =============================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" =============================================================================
" Plugin List
" =============================================================================
" Core Plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'scrooloose/syntastic'
Plug 'junegunn/seoul256.vim'
Plug 'altercation/vim-colors-solarized'

" Interface & Navigation
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'             " Added missing Tagbar plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Faster fuzzy finder
Plug 'junegunn/fzf.vim'              " Better alternative to CtrlP

" Code & Development
Plug 'scrooloose/nerdcommenter'
Plug 'davidhalter/jedi-vim'
Plug 'moorereason/vim-markdownfmt'
Plug 'nvie/vim-flake8'
Plug 'sheerun/vim-polyglot'
Plug 'python-mode/python-mode'
Plug 'github/copilot.vim'            " GitHub Copilot for AI-assisted development

" Added helpful plugins
Plug 'airblade/vim-gitgutter'        " Git diff in the gutter
Plug 'jiangmiao/auto-pairs'          " Insert/delete brackets in pairs
Plug 'preservim/nerdtree-tabs'       " NERDTree and tabs together

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" =============================================================================
" General Settings
" =============================================================================
set number                      " Show line numbers
set ruler                       " Show cursor position
set showcmd                     " Show command in bottom bar
set wildmenu                    " Visual autocomplete for command menu
set showmatch                   " Highlight matching brackets
set laststatus=2                " Always show status line
set backspace=indent,eol,start  " Make backspace behave normally
set hidden                      " Allow buffer switching without saving
set cursorline                  " Highlight current line
set encoding=utf-8              " Use UTF-8 encoding
set nobackup                    " Don't create backup files
set noswapfile                  " Don't create swap files
set scrolloff=5                 " Keep 5 lines below and above the cursor

" =============================================================================
" Colorscheme Settings
" =============================================================================
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:rehash256 = 1
set t_Co=256
colorscheme solarized
highlight Comment cterm=bold

" =============================================================================
" Python Settings
" =============================================================================
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

autocmd BufWritePost *.py call Flake8()

" Pyflakes
let g:PyFlakeOnWrite = 0
let g:PyFlakeCheckers = 'pep8,mccabe,frosted'
let g:PyFlakeDefaultComplexity=10
let g:PyFlakeAggressive = 3
let g:PyFlakeRangeCommand = 'Q'

" =============================================================================
" NERDTree Settings
" =============================================================================
" to open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" NERDTree Arrows
let g:NERDTreeDirArrowExpandable = "+"
let g:NERDTreeDirArrowCollapsible = "~"
"Show hidden files
let NERDTreeShowHidden=1

" =============================================================================
" Plugin Settings
" =============================================================================
" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1  " Use powerline fonts for better look

" FZF settings (replacement for CtrlP)
let g:fzf_layout = { 'down': '~40%' }

" =============================================================================
" Key Mappings
" =============================================================================
" Leader key
let mapleader = ","

" Navigation
map <C-f> :NERDTreeTabsToggle<CR>
nmap <C-t> :TagbarToggle<CR>
nmap <leader>f :Files<CR>  " FZF file search
nmap <leader>b :Buffers<CR>  " FZF buffer search

" Tab navigation
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>

" Python specific
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>
autocmd FileType python map <buffer> <leader>r :!python3 %<CR>  " Run Python file

" Syntax changing
nnoremap <leader>Th :set ft=htmljinja<CR>
nnoremap <leader>Tp :set ft=python<CR>
nnoremap <leader>Tj :set ft=javascript<CR>
nnoremap <leader>Tc :set ft=css<CR>
nnoremap <leader>Td :set ft=django<CR>

" Autocomplete
inoremap <C-space> <C-x><C-o>

" Save and quit shortcuts
nmap <leader>w :w!<CR>
nmap <leader>q :q<CR>
nmap <leader>wq :wq<CR>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
