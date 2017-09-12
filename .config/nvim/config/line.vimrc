" general config
set laststatus=2 " always show status line
" set showtabline=2 " always show tabline
set noshowmode " hide default mode text

" airline config
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1  " buffers at the top as tabs
let g:airline#extensions#tabline#show_tab_type=0
"let g:airline#extensions#tmuxline#enabled=0
let g:airline_theme = 'onedark'

" disable unused extensions (performance)
" let g:airline#extensions#ctrlp#color_template = 'insert'
" let g:airline#extensions#bufferline#enabled = 1
" let g:airline#extensions#capslock#enabled   = 0
" let g:airline#extensions#csv#enabled        = 0
" let g:airline#extensions#ctrlspace#enabled  = 0
" let g:airline#extensions#eclim#enabled      = 1
" let g:airline#extensions#hunks#enabled      = 0
" let g:airline#extensions#nrrwrgn#enabled    = 0
" let g:airline#extensions#promptline#enabled = 0
" let g:airline#extensions#syntastic#enabled  = 0
" let g:airline#extensions#taboo#enabled      = 0
" let g:airline#extensions#tagbar#enabled     = 0
" let g:airline#extensions#virtualenv#enabled = 0
" let g:airline#extensions#whitespace#enabled = 0
