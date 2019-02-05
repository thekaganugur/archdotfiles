let mapleader=","

call plug#begin('~/.nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/goyo.vim'
Plug 'mboughaba/i3config.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'altercation/vim-colors-solarized'
"      __                           _      __
"  __ / /__ __  _____ ____ ________(_)__  / /_
" / // / _ `/ |/ / _ `(_-</ __/ __/ / _ \/ __/
" \___/\_,_/|___/\_,_/___/\__/_/ /_/ .__/\__/
"                                 /_/
" -- Syntax --
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug '/hail2u/vim-css3-syntax'
" -- Nice Stuff --
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'itchyny/vim-cursorword'
" -- Linting, Auto Fix, Complation --
Plug 'w0rp/ale'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'


Plug 'vim-python/python-syntax'
Plug 'ncm2/ncm2-jedi'
call plug#end()


" Some basics:
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number
" Enable autocompletion:
set wildmenu
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" vim will share clipboard with the system
set clipboard=unnamedplus
" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e
set mouse=n
set cursorline


" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR><CR>
" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>


" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile *.Rmd,*.rmd,*.md,*.markdown,*.mdown set filetype=markdown
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

" Markdown autowrap text:
" au BufRead,BufNewFile *.md setlocal textwidth=80

" Use urlscan to choose and open a url:
:noremap <leader>u :w<Home> !urlscan -r 'linkhandler {}'<CR>
:noremap ,, !urlscan -r 'linkhandler {}'<CR>

" Enable Goyo by default for mutt writting
" Goyo's width will be the line limit in mutt.
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* :Goyo


" When shortcut files are updated, renew bash and ranger configs with new material:
autocmd BufWritePost ~/.bm* !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %


" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" -- Goyo --
" Ensure :q to quit even when Goyo is active
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()


" -- Search --
nnoremap <leader><space> :nohlsearch<CR>
set ignorecase  " ignore case when searching
set smartcase  " ignore case if search pattern is all lowercase, case-sensitive otherwise

" -- Indent --
set expandtab  " tabs are spaces
set autoindent
" set smarttab
set tabstop=4
autocmd BufRead,BufNewFile *.js,*.html,*.css set tabstop=2
set softtabstop=4
autocmd BufRead,BufNewFile *.js,*.html,*.css set softtabstop=2
set shiftwidth=4
autocmd BufRead,BufNewFile *.js,*.html,*.css set shiftwidth=2

set textwidth=79


set background=dark
colorscheme solarized
call togglebg#map("<F6>")

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

set noshowmode


"      __                           _      __
"  __ / /__ __  _____ ____ ________(_)__  / /_
" / // / _ `/ |/ / _ `(_-</ __/ __/ / _ \/ __/
" \___/\_,_/|___/\_,_/___/\__/_/ /_/ .__/\__/
"                                 /_/
"object/json syntax
hi def link jsObjectKey Label

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  }
\}

let g:closetag_filetypes = 'html,js,javascript,jsx'


" -- Linting, Auto Fix, Complation --
let g:ale_linters = {'jsx': ['stylelint', 'eslint'], 'python': ['flake8']}
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_fixers = {
 \   'javascript': ['prettier'],
 \   'javascript.jsx': ['prettier'],
 \   'python': ['yapf'],
\}

nmap <leader>d <Plug>(ale_fix)
let g:ale_javascript_prettier_use_local_config = 1 " use .prettiercr
highlight clear SignColumn " gutter is same color as background
" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

let g:ale_sign_warning='.'
let g:ale_sign_error='●'

let g:ale_lint_on_enter=0
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1


let g:LanguageClient_serverCommands = {
 \ 'javascript': ['javascript-typescript-stdio'],
 \ 'javascript.jsx': ['javascript-typescript-stdio'],
 \ 'python': ['pyls'],
 \ }
let  g:LanguageClient_useVirtualText = 0

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd BufRead,BufNewFile *js,*py set signcolumn=yes " always open the gutter


autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" -- Fzf Rg --
command! -bang -nargs=* Find call fzf#vim#grep( 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)
nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Rg<Cr>




augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END




" Terminal settings
au TermOpen * setlocal nonumber laststatus=0
tnoremap <leader><ESC> <C-\><C-n>
let g:neoterm_autoscroll = 1


" Tree style for netrw or vinegar
let g:netrw_liststyle = 3


" define function to toggle solarized theme
" change background and update lightline color scheme
function! ToggleSolarizedTheme()
  let &background = ( &background == "dark"? "light" : "dark" )
  if exists("g:lightline")
    runtime autoload/lightline/colorscheme/solarized.vim
    call lightline#colorscheme()
  endif
endfunction

" map F12 to ToggleSolarizedTheme() function
map <F12> :call ToggleSolarizedTheme()<CR>



" Python
let g:python_highlight_all = 1
