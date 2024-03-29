""" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker foldlevel=0 fen:

" coc {{
  " Smaller updatetime for CursorHold & CursorHoldI
  set updatetime=300

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  " Use tab for trigger completion with characters ahead and navigate.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

  function! s:show_documentation()
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
  if (strftime("%H") < 20) && (strftime("%H") > 5)
    hi CocHighlightText ctermbg=15 guibg=#eee8d5
  else
    hi CocHighlightText ctermbg=15 guibg=#003947
  endif


  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Use `:Format` for format current buffer
  command! -nargs=0 Format :call CocAction('format')
  " Use `:Fold` for fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" }}

" remaps {{
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  " Use <c-space> for trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[c` and `]c` for navigate diagnostics
  " nmap <silent> [c <Plug>(coc-diagnostic-prev)
  " nmap <silent> ]c <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gcd <Plug>(coc-definition)
  nmap <silent> gcy <Plug>(coc-type-definition)
  nmap <silent> gci <Plug>(coc-implementation)
  nmap <silent> gcr <Plug>(coc-references)

  " Use K for show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  " Remap for rename current word
  " nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  " vmap <leader>f  <Plug>(coc-format-selected)
  " nmap <leader>f  <Plug>(coc-format-selected)

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  " vmap <leader>a  <Plug>(coc-codeaction-selected)
  " nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  " nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  " nmap <leader>qf  <Plug>(coc-fix-current)

" Show all diagnostics
  " nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " " Manage extensions
  " nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " " Show commands
  " nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " " Find symbol of current document
  " nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " " Search workspace symbols
  " nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " " Do default action for next item.
  " nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " " Do default action for previous item.
  " nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " " Resume latest coc list
  " nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}
