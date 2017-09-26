" General ------------------------------------------------------------------{{{
" Always utf8
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8

syntax on
syntax enable

filetype plugin indent on

if (has("termguicolors"))
    set termguicolors
endif

" FYI this is how you can override color scheme options if needed.
"if (has("autocmd") && !has("gui"))
  "let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
  "autocmd ColorScheme * call onedark#set_highlight("ColorColumn", { "bg": s:white }) " No `bg` setting
"end

colorscheme onedark

set hlsearch
set number
" Don't autowrap comments
autocmd FileType * setlocal formatoptions-=c
" But highlight over 80 columns
call matchadd('ColorColumn', '\%81v', 100)

set showbreak=↪\
set listchars=tab:→\ ,extends:›,precedes:‹,trail:·,nbsp:·
set list

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set undodir=~/.config/nvim/undodir
set undofile
set undolevels=100
set undoreload=1000

" Unix as standard file type
set ffs=unix,dos,mac

set magic " for regular expressions
"}}}

" Tabs ---------------------------------------------------------------------{{{
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
"}}}

" Folds --------------------------------------------------------------------{{{
function! NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

set foldlevel=99

autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

autocmd FileType vim setlocal fdc=1
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0

autocmd FileType html setlocal fdl=99

autocmd FileType css,scss,json setlocal foldmethod=marker
autocmd FileType css,scss,json setlocal foldmarker={,}

autocmd FileType coffee,python setl foldmethod=indent
autocmd FileType html setl foldmethod=expr
let g:xml_syntax_folding = 1
autocmd FileType xml setl foldmethod=syntax
autocmd FileType html setl foldexpr=HTMLFolds()

autocmd FileType javascript,typescript,json setl foldmethod=syntax

autocmd FileType c,cpp setlocal foldmethod=syntax
"}}}
