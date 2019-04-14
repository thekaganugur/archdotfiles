set nocompatible
call plug#begin('~/.nvim/plugged')
Plug 'justinmk/vim-dirvish'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-markdown'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'ap/vim-css-color'
Plug 'raimondi/delimitmate'
Plug 'alvan/vim-closetag'
Plug 'machakann/vim-highlightedyank'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'junegunn/vim-easy-align'
Plug 'elzr/vim-json'
Plug 'liuchengxu/vista.vim'

Plug 'andymass/vim-matchup'
call plug#end()

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/coc.vim
