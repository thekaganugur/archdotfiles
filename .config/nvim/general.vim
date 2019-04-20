""" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker foldlevel=0 fen:

" general {{
  filetype plugin indent on
  syntax on
  set encoding=utf-8
  set hidden " allow buffer switch without saving
  set wildmenu
  set mouse=n
  set noshowmode
  set pumheight=15
  set splitbelow splitright
  " set noequalalways

  " Disables automatic commenting on newline:
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  " Trim whitespace onsave
  " autocmd BufWritePre * %s/\s\+$//e

  autocmd BufRead,BufNewFile *js,*py set signcolumn=yes
  autocmd BufRead,BufNewFile *.js,*.html,*.css,*py,*md set textwidth=79
  autocmd BufRead,BufNewFile *.js,*.html,*.css,*py,*md set colorcolumn=+1

  autocmd BufRead,BufNewFile .{jscs,jshint,eslint,prettier}rc set filetype=json

  " Terminal settings
  " autocmd  TermOpen * setlocal nonumber laststatus=0
  let g:neoterm_autoscroll = 1

  "  Script for cleaning out tex build files
  autocmd VimLeave *.tex :!texclear %
  " Run xrdb whenever Xdefaults or Xresources are updated.
  autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
" }}

" search {{
  set ignorecase
  set smartcase
" }}

" indent {{
  set wrap
  set expandtab
  set autoindent
  set smartindent
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  " autocmd BufRead,BufNewFile *.js,*.html,*.css set tabstop=2
  " autocmd BufRead,BufNewFile *.js,*.html,*.css set softtabstop=2
  " autocmd BufRead,BufNewFile *.js,*.html,*.css set shiftwidth=2
" }}

" colors {{
  if (strftime("%H") < 20) && (strftime("%H") > 5)
    set background=light
  else
    set background=dark
  endif
  set termguicolors
" }}

" completion config {{
  set complete+=k
  set complete-=t
  set completeopt=menu,preview
  " suppress the annoying 'match x of y', 'The only match' messages
  set shortmess+=c
" }}
