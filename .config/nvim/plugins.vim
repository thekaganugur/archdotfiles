""" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker foldlevel=0 fen:

" solarized8 {{
  colorscheme solarized8_flat
  let g:solarized_term_italics=1
"}}

" lightline {{
  let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'component_function': {
    \   'filename': 'LightlineFilename',
    \ }
    \ }
	let g:lightline.active = {
	  \ 'left': [ [ 'mode', 'paste' ],
	  \           [ 'readonly', 'filename', 'modified' ] ],
	  \ 'right': [ [ 'lineinfo' ],
	  \            [ 'percent' ],
	  \            [ 'filetype' ] ]
    \}
  function! ToggleSolarizedTheme()
    let &background = ( &background == "dark"? "light" : "dark" )
    if exists("g:lightline")
      runtime autoload/lightline/colorscheme/solarized.vim
      call lightline#colorscheme()
    endif
  endfunction

  function! LightlineFilename()
    let root = fnamemodify(get(b:, 'git_dir'), ':h')
    let path = expand('%:p')
    if path[:len(root)-1] ==# root
      return path[len(root)+1:]
    endif
    return expand('%')
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
  nnoremap <silent><leader>f :Goyo<CR>
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

" python {{
  " let g:python_highlight_all = 1
" }}


" fzf {{
  command! -bang -nargs=* Find call fzf#vim#grep( 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)

  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 ruler

  augroup netrw_buf_hidden_fix
    autocmd!
    " Set all non-netrw buffers to bufhidden=hide
    autocmd BufWinEnter *
      \  if &ft != 'netrw'
      \|     set bufhidden=hide
      \| endif
  augroup end

  nnoremap <silent><C-p> :Files<Cr>
  nnoremap <silent><C-g> :Rg<Cr>
" }}

" ale {{
  let g:ale_linters = {'jsx': ['stylelint', 'eslint'], 'python': ['flake8']}
  let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
  let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'javascript': ['prettier'],
    \   'javascript.jsx': ['prettier'],
    \   'html': ['prettier'],
    \   'markdown': ['prettier'],
    \   'json': ['prettier'],
    \   'python': ['yapf']
    \}
  let g:ale_sign_error='●'
  let g:ale_sign_warning='·'
  let g:ale_sign_info = '·'
  let g:ale_echo_msg_error_str = 'E'
  let g:ale_echo_msg_info_str = 'I'
  let g:ale_echo_msg_warning_str = 'W'
  let g:ale_echo_msg_format = '[%linter%][%severity%]: %s '

  let g:ale_lint_on_enter=0
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_fix_on_save = 1
  let g:ale_javascript_eslint_suppress_missing_config  = 1
  " let g:ale_javascript_prettier_options = '--single-quote'
  nmap <leader>d <Plug>(ale_fix)
  " Move between linting errors
  nmap ]r :ALENextWrap<CR>
  nmap [r :ALEPreviousWrap<CR>
" }}

" easyalign {{
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
" }}

" matchup {{
  let g:matchup_matchparen_status_offscreen = 0
" }}
