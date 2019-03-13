let mapleader=","

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
map <leader>c :w! \| !compiler <c-r>%<CR><CR>
" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" Use urlscan to choose and open a url:
map <leader>u :w<Home> !urlscan -r 'linkhandler {}'<CR>
map ,, !urlscan -r 'linkhandler {}'<CR>

" - Terminal settings -
tnoremap <leader><ESC> <C-\><C-n>

" -- Plugins --
nmap <leader>f :Goyo \| set linebreak<CR>

" - LanguageClient -
nmap <F5> :call LanguageClient_contextMenu()<CR>
nmap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" - Fzf Rg -
nmap <C-p> :Files<Cr>
nmap <C-g> :Rg<Cr>

" - ALE -
nmap <leader>d <Plug>(ale_fix)
" Move between linting errors
nmap ]r :ALENextWrap<CR>
nmap [r :ALEPreviousWrap<CR>

" - Emmet -
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" - Lightline (custom func) -
map <F12> :call ToggleSolarizedTheme()<CR>

" - NCM2 -
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
