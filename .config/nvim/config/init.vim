" Load Plugins

call plug#begin('~/.config/nvim/plugged')

" Colorschemes
Plug 'joshdick/onedark.vim'

" General
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake'
Plug 'vim-pandoc/vim-pandoc'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Syntax
Plug 'ElmCast/elm-vim'
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Eyecandy
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Rust
Plug 'racer-rust/vim-racer'

call plug#end()
