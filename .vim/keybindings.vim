"=====================================================
" User hotkeys
"=====================================================
"
" " Nerdtree shortcut
 map <F3> :NERDTreeTabsToggle<CR>
"
" ConqueTerm
" bash on F5
nnoremap <F5> :ConqueTermSplit bash<CR>
" and ipython on <F6>
nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0
" check python code via PEP8 <leader>8
"autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>
"
" autocomplete <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

" syntax change
nnoremap <leader>Th :set ft=htmljinja<CR>
nnoremap <leader>Tp :set ft=python<CR>
nnoremap <leader>Tj :set ft=javascript<CR>
nnoremap <leader>Tc :set ft=css<CR>
nnoremap <leader>Td :set ft=django<CR>

" Run Pyflakes for current file
nmap <F7> :PyFlake<CR> 

" Tagbar
nmap <F8> :TagbarToggle<CR>

"Tabs mapping
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

