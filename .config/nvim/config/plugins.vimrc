" - Lightline -
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
" Toggle background and update lightline color scheme
function! ToggleSolarizedTheme()
  let &background = ( &background == "dark"? "light" : "dark" )
  if exists("g:lightline")
    runtime autoload/lightline/colorscheme/solarized.vim
    call lightline#colorscheme()
  endif
endfunction

" - vim-javascript -
" For getting better object/json syntax
highlight def link jsObjectKey Label

" - vim-closetag -
let g:closetag_filetypes = 'html,js,javascript,jsx'

" - Emmet -
" let g:user_emmet_settings = {
" \  'javascript.jsx' : {
" \      'extends' : 'jsx',
" \  }
" \}

" - ALE -
let g:ale_linters = {'jsx': ['stylelint', 'eslint'], 'python': ['flake8']}
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_fixers = {
 \   'javascript': ['prettier'],
 \   'javascript.jsx': ['prettier'],
 \   'python': ['yapf'],
\}
" use .prettiercr
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_sign_warning='.'
let g:ale_sign_error='●'
let g:ale_lint_on_enter=0
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1

" - LanguageClient -
let g:LanguageClient_serverCommands = {
 \ 'javascript': ['javascript-typescript-stdio'],
 \ 'javascript.jsx': ['javascript-typescript-stdio'],
 \ 'python': ['pyls'],
 \ }
let  g:LanguageClient_useVirtualText = 0

" - NCM2 -
" autocmd BufEnter * call ncm2#enable_for_buffer()
" " :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect
" " Suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" " found' messages
" set shortmess+=c

" - Fzf Rg -
command! -bang -nargs=* Find call fzf#vim#grep( 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)

" - Vinegar -
" Tree style for netrw or vinegar
let g:netrw_liststyle = 3

" Python
let g:python_highlight_all = 1
