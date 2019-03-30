""" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker foldlevel=0 fen:

" leader {{
    let mapleader = "\<Space>"
    nnoremap <leader>ev :vs $MYVIMRC<CR>
    nnoremap <leader>sv :source $MYVIMRC<CR>
    nnoremap <leader>" :nohl<CR>
    nnoremap <leader>s :setlocal spell! spelllang=en_us<CR>
    " switch between the last two files
    nnoremap <Leader><Leader> <C-^>
    " compile document with custom script
    nnoremap <leader>c :w! \|  !compiler %<CR>
    " open corresponding .pdf/.html or preview
    nnoremap <leader>p :!opout %<CR><CR>
" }}


nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"  terminal settings
tnoremap <leader><ESC> <C-\><C-n>
