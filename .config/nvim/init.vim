let mapleader=","

call plug#begin('~/.nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'mboughaba/i3config.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
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
Plug 'ap/vim-css-color'
" -- Nice Stuff --
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
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
" Plug 'ncm2/nvim-typescript', {'do': './install.sh'}
"  Plug 'Shougo/deoplete.nvim'
call plug#end()


" Some basics:
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber
" Enable autocompletion:
set wildmenu
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" vim will share clipboard with the system
set clipboard=unnamedplus
" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e
" Enable buffer resizeing by mouse
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
autocmd BufRead,BufNewFile *.Rmd',*.rmd,*.md,*.markdown,*.mdown set filetype=markdown
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

" Markdown autowrap text:
au BufRead,BufNewFile *.md setlocal textwidth=80

" Use urlscan to choose and open a url:
:noremap <leader>u :w<Home> !urlscan -r 'linkhandler {}'<CR>
:noremap ,, !urlscan -r 'linkhandler {}'<CR>

" Enable Goyo by default for mutt writting
" Goyo's width will be the line limit in mutt.
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo



" When shortcut files are updated, renew bash and ranger configs with new material:
autocmd BufWritePost ~/.bm* !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %



" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" -- Search --
nnoremap <leader><space> :nohlsearch<CR>
set ignorecase  " ignore case when searching
set smartcase  " ignore case if search pattern is all lowercase, case-sensitive otherwise

"set hlsearch  " highlight matches
"set copyindent  " copy the previous indentation on autoindenting
"set shiftround  " use multiple of shiftwidth when indenting with '<' and '>'
"set showmatch  " set show matching parenthesis
"set incsearch  " show search matches as you type

" -- Indent --
set expandtab  " tabs are spaces
set autoindent
set smarttab
set softtabstop=4
" For .js files I use 2 spaces.
autocmd BufRead,BufNewFile *js set softtabstop=2
set shiftwidth=4
autocmd BufRead,BufNewFile *js set shiftwidth=2



set termguicolors
colorscheme gruvbox
set background=dark


"      __                           _      __
"  __ / /__ __  _____ ____ ________(_)__  / /_
" / // / _ `/ |/ / _ `(_-</ __/ __/ / _ \/ __/
" \___/\_,_/|___/\_,_/___/\__/_/ /_/ .__/\__/
"                                 /_/

" --------------- Plugin Settings Stuff ---------------
" **vim-javascript
"object/json syntax
hi def link jsObjectKey Label

" **emmet-vim
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  }
\}

" **vim-closetag
let g:closetag_filetypes = 'html,js,javascript.jsx'
" let g:closetag_emptyTags_caseSensitive = 1
" let g:closetag_shortcut = '>'
" let g:closetag_close_shortcut = '<leader>>'



" -- Linting, Auto Fix, Complation --
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'javascript.jsx': ['prettier'],
\}
let g:ale_fix_on_save = 1
nmap <leader>d <Plug>(ale_fix)
let g:ale_javascript_prettier_use_local_config = 1 " use .prettiercr
autocmd BufRead,BufNewFile *js let g:ale_sign_column_always = 1 " always open the gutter
highlight clear SignColumn " gutter is same color as background
" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>
let g:airline#extensions#ale#enabled = 1 " error & warning shown in airline


let g:LanguageClient_serverCommands = {
 \ 'javascript': ['javascript-typescript-stdio'],
 \ 'javascript.jsx': ['javascript-typescript-stdio'],
 \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


" enable ncm2 for all buffers
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










nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
