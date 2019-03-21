let mapleader=","

" Quickly open vimrc
nnoremap <leader>ev :vs $MYVIMRC<CR>
" Quickly source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

map <leader><space> :nohl<CR>
map <leader>s :setlocal spell! spelllang=en_us<CR>

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Switch between the last two files
map <Leader><Leader> <C-^>

" Compile document with custom script
map <leader>c :w! \|  !compiler %<CR>
" Open corresponding .pdf/.html or preview
map <leader>p :!opout %<CR><CR>

" Use urlscan to choose and open a url:
map <leader>u :w<Home> !urlscan -r 'linkhandler {}'<CR>
map ,, !urlscan -r 'linkhandler {}'<CR>

" - Terminal settings -
tnoremap <leader><ESC> <C-\><C-n>

" -- Plugins --
" - Lightline (custom func) -
map <F12> :call ToggleSolarizedTheme()<CR>

" - Goyo -
nmap <leader>f :Goyo \| set linebreak<CR>

" - Fzf Rg -
nmap <C-p> :Files<Cr>
nmap <C-g> :Rg<Cr>

" - ALE -
nmap <leader>d <Plug>(ale_fix)
" Move between linting errors
nmap ]r :ALENextWrap<CR>
nmap [r :ALEPreviousWrap<CR>

" -- Compleation --
" Use <TAB> to select the popup menu:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
