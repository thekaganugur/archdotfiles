call plug#begin('~/.nvim/plugged')
" General
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
" Color Scheme
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'joshdick/onedark.vim'

" Syntax
" Plug 'sheerun/vim-polyglot'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'hail2u/vim-css3-syntax'
Plug 'vim-python/python-syntax'
Plug 'tpope/vim-markdown'
Plug 'chemzqm/vim-jsx-improve'

" Nice Stuff
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'itchyny/vim-cursorword'

" Linting, LSP, Completion
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'Shougo/echodoc.vim'
call plug#end()
