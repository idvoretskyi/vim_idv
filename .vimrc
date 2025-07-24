" =============================================================================
" IDV's Vim Configuration
" =============================================================================
" A comprehensive Vim configuration focused on Python development and
" general productivity with modern plugins and sensible defaults.
"
" Author: Igor Dvoretskyi
" Repository: https://github.com/idvoretskyi/vim_idv
" =============================================================================

" =============================================================================
" Vim-Plug Plugin Manager Setup
" =============================================================================
" Auto-install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initialize plugin system
call plug#begin('~/.vim/plugged')

" =============================================================================
" Core Plugins - Essential functionality and sensible defaults
" =============================================================================
Plug 'tpope/vim-sensible'           " Sensible defaults for Vim
Plug 'tpope/vim-fugitive'           " Git integration
Plug 'tpope/vim-markdown'           " Enhanced markdown support

" =============================================================================
" Code Quality & Linting
" =============================================================================
Plug 'scrooloose/syntastic'         " Syntax checking framework
Plug 'nvie/vim-flake8'              " Python PEP8 checker

" =============================================================================
" Interface & Navigation Plugins
" =============================================================================
Plug 'vim-airline/vim-airline'                          " Enhanced status line
Plug 'vim-airline/vim-airline-themes'                   " Themes for airline
Plug 'scrooloose/nerdtree'                             " File explorer
Plug 'Xuyuanp/nerdtree-git-plugin'                     " Git status in NERDTree
Plug 'preservim/nerdtree-tabs'                         " NERDTree with tabs
Plug 'majutsushi/tagbar'                               " Code structure browser
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " Fuzzy finder
Plug 'junegunn/fzf.vim'                                " FZF integration

" =============================================================================
" Code Development & Editing
" =============================================================================
Plug 'scrooloose/nerdcommenter'     " Easy commenting
Plug 'jiangmiao/auto-pairs'         " Auto-close brackets and quotes
Plug 'sheerun/vim-polyglot'         " Language pack collection
Plug 'github/copilot.vim'           " AI-powered code assistance

" =============================================================================
" Python Development
" =============================================================================
Plug 'davidhalter/jedi-vim'         " Python autocompletion and navigation
Plug 'python-mode/python-mode'     " Comprehensive Python IDE features

" =============================================================================
" Git Integration
" =============================================================================
Plug 'airblade/vim-gitgutter'       " Git diff indicators in gutter

" =============================================================================
" Markdown & Documentation
" =============================================================================
Plug 'moorereason/vim-markdownfmt'  " Markdown formatting

" =============================================================================
" Color Schemes
" =============================================================================
Plug 'junegunn/seoul256.vim'        " Seoul256 color scheme
Plug 'altercation/vim-colors-solarized' " Solarized color scheme

" Finalize plugin installation
call plug#end()

" =============================================================================
" General Settings - Core Vim behavior and appearance
" =============================================================================

" Display and Interface
set number                      " Show line numbers
set ruler                       " Show cursor position in status line
set showcmd                     " Show command in bottom bar
set wildmenu                    " Visual autocomplete for command menu
set showmatch                   " Highlight matching brackets
set laststatus=2                " Always show status line
set cursorline                  " Highlight current line
set scrolloff=5                 " Keep 5 lines below and above cursor

" Text Editing Behavior
set backspace=indent,eol,start  " Make backspace behave normally
set hidden                      " Allow buffer switching without saving
set encoding=utf-8              " Use UTF-8 encoding

" File Management
set nobackup                    " Disable backup files (we use git)
set noswapfile                  " Disable swap files (causes more issues than helps)
set undofile                    " Enable persistent undo history
set undodir=~/.vim/undo         " Directory for undo files

" Search Behavior
set ignorecase                  " Case insensitive search
set smartcase                   " Override ignorecase if uppercase is used
set incsearch                   " Incremental search as you type
set hlsearch                    " Highlight search results

" =============================================================================
" Color Scheme and Visual Appearance
" =============================================================================

" Enable syntax highlighting
syntax enable

" Color scheme configuration
set background=dark             " Use dark background
set t_Co=256                   " Enable 256 colors

" Solarized color scheme settings
let g:solarized_termcolors=256  " Use 256 color version
let g:rehash256 = 1            " Better color accuracy

" Apply color scheme
colorscheme solarized

" Custom highlighting
highlight Comment cterm=bold   " Make comments bold for better readability

" =============================================================================
" Python Development Configuration
" =============================================================================

" Python-mode settings
let g:pymode_python = 'python3'        " Use Python 3
let g:pymode_lint_cwindow = 0          " Don't auto-open quickfix window

" PEP 8 compliance settings
augroup python_settings
    autocmd!
    autocmd FileType python setlocal textwidth=79      " Line length limit
    autocmd FileType python setlocal shiftwidth=4      " Indentation width
    autocmd FileType python setlocal tabstop=4         " Tab display width
    autocmd FileType python setlocal expandtab         " Use spaces instead of tabs
    autocmd FileType python setlocal softtabstop=4     " Soft tab width
    autocmd FileType python setlocal shiftround        " Round indents to shiftwidth
    autocmd FileType python setlocal autoindent        " Auto-indent new lines
    autocmd FileType python setlocal smartindent       " Smart indentation
    
    " Auto-run flake8 on save
    autocmd BufWritePost *.py call Flake8()
augroup END

" Flake8 configuration
let g:flake8_show_in_gutter = 1        " Show errors in gutter
let g:flake8_show_in_file = 1          " Show errors in file

" Python-mode lint settings (alternative to flake8)
let g:PyFlakeOnWrite = 0               " Disable on-write checking
let g:PyFlakeCheckers = 'pep8,mccabe,frosted'  " Enabled checkers
let g:PyFlakeDefaultComplexity = 10    " Maximum complexity
let g:PyFlakeAggressive = 3            " Aggressiveness level
let g:PyFlakeRangeCommand = 'Q'        " Range checking command

" =============================================================================
" NERDTree File Explorer Configuration
" =============================================================================

" Auto-open NERDTree when vim starts with no files
augroup nerdtree_settings
    autocmd!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    
    " Close vim if NERDTree is the only window left
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END

" NERDTree appearance
let g:NERDTreeDirArrowExpandable = "+"    " Expandable directory symbol
let g:NERDTreeDirArrowCollapsible = "~"   " Collapsible directory symbol
let g:NERDTreeShowHidden = 1              " Show hidden files
let g:NERDTreeMinimalUI = 1               " Minimal UI
let g:NERDTreeShowLineNumbers = 0         " Hide line numbers
let g:NERDTreeWinSize = 30               " Window width

" NERDTree file filters
let g:NERDTreeIgnore = ['\.pyc$', '\.pyo$', '__pycache__', '.git', '.DS_Store']

" =============================================================================
" Plugin Configuration - Settings for installed plugins
" =============================================================================

" Airline Status Line Configuration
let g:airline#extensions#tabline#enabled = 1      " Enable tabline
let g:airline#extensions#tabline#left_sep = ' '   " Tab separator
let g:airline#extensions#tabline#left_alt_sep = '|'  " Alternative separator
let g:airline_powerline_fonts = 1                 " Use powerline fonts
let g:airline#extensions#branch#enabled = 1       " Show git branch
let g:airline#extensions#hunks#enabled = 1        " Show git changes

" FZF Fuzzy Finder Configuration
let g:fzf_layout = { 'down': '~40%' }             " FZF window layout
let g:fzf_preview_window = ['right:50%', 'ctrl-/'] " Preview window
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" Git Gutter Configuration
let g:gitgutter_enabled = 1                       " Enable git gutter
let g:gitgutter_map_keys = 0                      " Disable default mappings
let g:gitgutter_highlight_linenrs = 1             " Highlight line numbers

" Syntastic Configuration
let g:syntastic_always_populate_loc_list = 1      " Populate location list
let g:syntastic_auto_loc_list = 1                 " Auto open/close location list
let g:syntastic_check_on_open = 1                 " Check on file open
let g:syntastic_check_on_wq = 0                   " Don't check on :wq

" Auto-pairs Configuration
let g:AutoPairsMapCR = 1                          " Map <CR> for auto-pairs

" =============================================================================
" Key Mappings and Shortcuts
" =============================================================================

" Set leader key for custom shortcuts
let mapleader = ","

" =============================================================================
" File and Buffer Navigation
" =============================================================================

" File explorer and project navigation
nnoremap <C-f> :NERDTreeTabsToggle<CR>           " Toggle file explorer
nnoremap <C-t> :TagbarToggle<CR>                 " Toggle code structure
nnoremap <leader>f :Files<CR>                    " FZF file search
nnoremap <leader>b :Buffers<CR>                  " FZF buffer search
nnoremap <leader>g :Rg<CR>                       " FZF grep search
nnoremap <leader>h :History<CR>                  " FZF file history

" Tab navigation
nnoremap <C-l> :tabn<CR>                         " Next tab
nnoremap <C-h> :tabp<CR>                         " Previous tab
nnoremap <C-n> :tabnew<CR>                       " New tab

" Window/split navigation (improved)
nnoremap <C-J> <C-W><C-J>                        " Move to split below
nnoremap <C-K> <C-W><C-K>                        " Move to split above
nnoremap <C-L> <C-W><C-L>                        " Move to split right
nnoremap <C-H> <C-W><C-H>                        " Move to split left

" =============================================================================
" File Operations
" =============================================================================

" Save and quit shortcuts
nnoremap <leader>w :w!<CR>                       " Force write
nnoremap <leader>q :q<CR>                        " Quit
nnoremap <leader>wq :wq<CR>                      " Write and quit
nnoremap <leader>x :x<CR>                        " Save and exit

" =============================================================================
" Development and Language-Specific Mappings
" =============================================================================

" Python development shortcuts
augroup python_mappings
    autocmd!
    autocmd FileType python nnoremap <buffer> <leader>r :!python3 %<CR>  " Run Python file
    autocmd FileType python nnoremap <buffer> <leader>8 :PymodeLint<CR>  " Lint Python file
    autocmd FileType python nnoremap <buffer> <leader>d :PymodeDoc<CR>   " Show documentation
augroup END

" Syntax highlighting shortcuts
nnoremap <leader>th :set ft=htmljinja<CR>        " HTML Jinja syntax
nnoremap <leader>tp :set ft=python<CR>           " Python syntax
nnoremap <leader>tj :set ft=javascript<CR>       " JavaScript syntax
nnoremap <leader>tc :set ft=css<CR>              " CSS syntax
nnoremap <leader>td :set ft=django<CR>           " Django syntax

" =============================================================================
" Git and Version Control
" =============================================================================

" Git shortcuts
nnoremap <leader>gs :Git status<CR>              " Git status
nnoremap <leader>gc :Git commit<CR>              " Git commit
nnoremap <leader>gp :Git push<CR>                " Git push
nnoremap <leader>gl :Git log --oneline<CR>       " Git log

" Git gutter navigation
nnoremap ]h :GitGutterNextHunk<CR>               " Next git hunk
nnoremap [h :GitGutterPrevHunk<CR>               " Previous git hunk

" =============================================================================
" Editing and Text Manipulation
" =============================================================================

" Auto-completion
inoremap <C-Space> <C-x><C-o>                    " Trigger omni-completion

" Clear search highlighting
nnoremap <leader><Space> :nohlsearch<CR>         " Clear search highlight

" Toggle paste mode
nnoremap <leader>p :set paste!<CR>               " Toggle paste mode

" =============================================================================
" Custom Functions and Advanced Mappings
" =============================================================================

" Quick edit vimrc
nnoremap <leader>ev :edit $MYVIMRC<CR>           " Edit vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>         " Source vimrc

" =============================================================================
" Performance Optimizations
" =============================================================================

" Faster redrawing
set ttyfast                                       " Fast terminal
set lazyredraw                                    " Don't redraw during macros

" Optimize for large files
set synmaxcol=200                                 " Limit syntax highlighting
set regexpengine=1                                " Use old regexp engine

" Reduce updatetime for better experience
set updatetime=250                                " Faster completion

" =============================================================================
" Final Configurations and Cleanup
" =============================================================================

" Auto-create required directories on startup
augroup auto_mkdir
    autocmd!
    autocmd BufNewFile * call mkdir(fnamemodify(expand('<afile>'), ':h'), 'p')
augroup END

" Remember cursor position
augroup remember_cursor
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" =============================================================================
" End of Configuration
" =============================================================================
" IDV's Vim Configuration - Loaded Successfully! 
" For support: https://github.com/idvoretskyi/vim_idv
