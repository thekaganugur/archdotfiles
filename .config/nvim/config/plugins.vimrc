" - Lightline -
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }
" Toggle background and update lightline color scheme
function! ToggleSolarizedTheme()
  let &background = ( &background == "dark"? "light" : "dark" )
  if exists("g:lightline")
    runtime autoload/lightline/colorscheme/solarized.vim
    call lightline#colorscheme()
  endif
endfunction

" - Fzf Rg -
command! -bang -nargs=* Find call fzf#vim#grep( 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)

" - Vinegar -
" Tree style for netrw or vinegar
let g:netrw_liststyle = 3

" - vim-javascript -
" For getting better object/json syntax
highlight def link jsObjectKey Label

" - vim-closetag -
let g:closetag_filetypes = 'html,js,javascript,jsx'

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

" Python
let g:python_highlight_all = 1

let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'typescript']

let g:echodoc_enable_at_startup = 1
