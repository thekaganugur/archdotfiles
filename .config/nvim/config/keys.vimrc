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
map <leader>c :w! \|  !compiler %<CR>
" Open corresponding .pdf/.html or preview
map <leader>p :!opout %<CR><CR>

" Use urlscan to choose and open a url:
map <leader>u :w<Home> !urlscan -r 'linkhandler {}'<CR>
map ,, !urlscan -r 'linkhandler {}'<CR>

" - Terminal settings -
tnoremap <leader><ESC> <C-\><C-n>

" - Compleation popup -
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" -- Plugins --

" - Lightline (custom func) -
map <F12> :call ToggleSolarizedTheme()<CR>

" - Emmet -
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" - Goyo -
nmap <leader>f :Goyo \| set linebreak<CR>

" - Fzf Rg -
nmap <C-p> :Files<Cr>
nmap <C-g> :Rg<Cr>

" - LanguageClient -
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nmap <silent> K :call LanguageClient#textDocument_hover()<CR>
nmap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nmap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" - ALE -
nmap <leader>d <Plug>(ale_fix)
" Move between linting errors
nmap ]r :ALENextWrap<CR>
nmap [r :ALEPreviousWrap<CR>

" - Deoplete -
let g:deoplete#enable_at_startup = 1
" Use smartcase.
call deoplete#custom#option('smart_case', v:true)
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction
