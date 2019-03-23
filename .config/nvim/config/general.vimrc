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
set noequalalways

" Disables automatic commenting on newline:
 autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Trim whitespace onsave
autocmd BufWritePre * %s/\s\+$//e

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
if (strftime("%H") < 19) && (strftime("%H") > 5)
  set background=light
else
  set background=dark
endif

set termguicolors

" set background=light        " for the light version
  set background=dark
let g:one_allow_italics = 1 " I love italic for comments
colorscheme one

" colorscheme solarized8_flat
" let g:solarized_term_italics=1

" colorscheme OceanicNext
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1

" highlight link CocErrorSign   GruvboxRedSign
" highlight link CocWarningSign GruvboxYellowSign
" highlight link CocInfoSign    GruvboxYellowSign
" highlight link CocHintSign    GruvboxBlueSign
" highlight link CocFloating SignColumn

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


" don't give |ins-completion-menu| messages.
" set shortmess+=c
" set pumheight=12
" set complete+=k
" set complete-=t
" set completeopt=menu,preview

" if hidden is not set, TextEdit might fail.
set hidden
