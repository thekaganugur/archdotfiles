filetype plugin indent on
syntax on

set encoding=utf-8
set wildmenu
set clipboard=unnamedplus
set mouse=n
set noshowmode
" gutter is same color as background
highlight clear SignColumn
set splitbelow splitright
" set noequalalways

" Disables automatic commenting on newline:
 autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Trim whitespace onsave
autocmd BufWritePre * %s/\s\+$//e

" set number
" augroup CursorLine
"     au!
"     au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"     au WinLeave * setlocal nocursorline
" augroup END

" Search
set ignorecase
set smartcase

" Indent
set expandtab
set autoindent
set smartindent
set tabstop=4
autocmd BufRead,BufNewFile *.js,*.html,*.css set tabstop=2
set softtabstop=4
autocmd BufRead,BufNewFile *.js,*.html,*.css set softtabstop=2
set shiftwidth=4
autocmd BufRead,BufNewFile *.js,*.html,*.css set shiftwidth=2

" Colors
colorscheme solarized
if strftime("%H") < 17
  set background=light
else
  set background=dark
endif

"  Script for cleaning out tex build files whenever vim is closed out of a .tex file.
autocmd VimLeave *.tex :!texclear %

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile *.Rmd,*.rmd,*.md,*.markdown,*.mdown set filetype=markdown
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

autocmd BufRead,BufNewFile *.js,*.html,*.css,*py,*md set textwidth=79
" highlight column after 'textwidth'
autocmd BufRead,BufNewFile *.js,*.html,*.css,*py,*md set colorcolumn=+1

" always open gutter on according files
autocmd BufRead,BufNewFile *js,*py set signcolumn=yes

" Terminal settings
autocmd  TermOpen * setlocal nonumber laststatus=0
let g:neoterm_autoscroll = 1
