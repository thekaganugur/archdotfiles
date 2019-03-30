""" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker foldlevel=0 fen:

" solarized8 {{
    colorscheme solarized8_flat
    let g:solarized_term_italics=1
"}}

" lightline {{
  let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ }
	let g:lightline.active = {
	  \ 'left': [ [ 'mode', 'paste' ],
	  \           [ 'readonly', 'filename', 'modified' ] ],
	  \ 'right': [ [ 'lineinfo' ],
	  \            [ 'percent' ],
	  \            [ 'filetype' ] ] }
  function! ToggleSolarizedTheme()
    let &background = ( &background == "dark"? "light" : "dark" )
    if exists("g:lightline")
      runtime autoload/lightline/colorscheme/solarized.vim
      call lightline#colorscheme()
    endif
  endfunction
  map <F7> :call ToggleSolarizedTheme()<CR>
" }}

" vinegar {{
" Tree style for netrw or vinegar
" let g:netrw_liststyle = 3
let g:netrw_dirhistmax=0
" }}

" vim-closetag {{
let g:closetag_filetypes = 'html,js,javascript,jsx'
" }}

" goyo {{
    nmap <silent><leader>f :Goyo<CR>
" }}

" vim-highlightedyank {{
  let g:highlightedyank_highlight_duration = 250
" }}


" polyglot {{
  let g:polyglot_disabled = ['markdown']
" }}

" vim-markdown {{
  let g:markdown_fenced_languages = ['vim', 'css', 'javascript', 'js=javascript', 'typescript']
" }}

" vim-javascript {{
  " For getting better object/json syntax
  " highlight def link jsObjectKey Label
" }}

" python {{
" let g:python_highlight_all = 1
" }}


" fzf {{
  command! -bang -nargs=* Find call fzf#vim#grep( 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)

  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


  augroup netrw_buf_hidden_fix
    autocmd!

    " Set all non-netrw buffers to bufhidden=hide
    autocmd BufWinEnter *
          \  if &ft != 'netrw'
          \|     set bufhidden=hide
          \| endif

  augroup end
  nmap <silent><C-p> :Files<Cr>
  nmap <silent><C-g> :Rg<Cr>
" }}

" ale {{
  let g:ale_linters = {'jsx': ['stylelint', 'eslint'], 'python': ['flake8']}
  let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
  let g:ale_fixers = {
    \   'javascript': ['prettier'],
    \   'javascript.jsx': ['prettier'],
    \   'python': ['yapf'],
    \   'markdown': ['prettier'],
    \   'json': ['prettier']
    \}

  let g:ale_sign_column_always = 1
  let g:ale_sign_warning='·'
  let g:ale_sign_error='●'
  let g:ale_sign_info = 'i'
  let g:ale_echo_msg_error_str = 'E'
  let g:ale_echo_msg_warning_str = 'W'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
  let g:ale_lint_on_enter=0
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_fix_on_save = 1
  let g:ale_javascript_eslint_suppress_missing_config  = 1
  " use .prettiercr
  let g:ale_javascript_prettier_use_local_config = 1
  let g:ale_javascript_prettier_options = '--single-quote'
  nmap <leader>d <Plug>(ale_fix)
  nmap <F8> <Plug>(ale_fix)
  " Move between linting errors
  nmap ]r :ALENextWrap<CR>
  nmap [r :ALEPreviousWrap<CR>
" }}

" echodoc {{
" let g:echodoc_enable_at_startup = 1
" set cmdheight=2
" }}
