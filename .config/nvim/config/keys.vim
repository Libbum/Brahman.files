" Workman layout home row --------------------------------------------------{{{
"(O)pen line -> (L)ine
nnoremap l o
nnoremap o l
nnoremap L O
nnoremap O L
vnoremap l o
vnoremap o l
vnoremap L O
vnoremap O L
"Search (N)ext -> (J)ump
nnoremap j n
nnoremap n j
nnoremap J N
nnoremap N J
nnoremap gn gj
nnoremap gj gn
vnoremap j n
vnoremap n j
vnoremap J N
vnoremap N J
"(E)nd of word -> brea(K) of word
nnoremap k e
nnoremap e k
nnoremap K E
nnoremap E <nop>
nnoremap gk ge
nnoremap ge gk
vnoremap k e
vnoremap e k
vnoremap K E
vnoremap E <nop>
"(Y)ank -> (H)aul
nnoremap h y
onoremap h y
nnoremap y h
nnoremap H Y
nnoremap Y H
vnoremap h y
vnoremap y h
vnoremap H Y
vnoremap Y H
"}}}

" Leaders ------------------------------------------------------------------{{{
" map Leaders
let mapleader = " "
" keep backward f search, remapping it to ,;
let maplocalleader = ","
nnoremap <LocalLeader>; ,

" buffer keys
nnoremap <Leader>bb :b#<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bf :bf<CR>
nnoremap <Leader>bl :bl<CR>
nnoremap <Leader>bw :w<CR>:bd<CR>
nnoremap <Leader>bd :bd!<CR>
" new buffer/tab
nnoremap <Leader>e :enew<CR>

"fzf
nnoremap <Leader>t :Files<CR>

" neomake
nmap <Leader><Space>o :lopen<CR>
nmap <Leader><Space>c :lclose<CR>
nmap <Leader><Space>, :ll<CR>
nmap <Leader><Space>n :lnext<CR>
nmap <Leader><Space>p :lprev<CR>

" pandoc notes
nnoremap <silent> <Leader>pn :if g:pandoc#command#autoexec_on_writes \| echom "Disabled pandoc autosave." \| else \| echom "Enabled pandoc autosave." \| endif \| let g:pandoc#command#autoexec_on_writes = 1-g:pandoc#command#autoexec_on_writes<CR>
nnoremap <Leader>pv :Pandoc! #notes<CR>
"}}}

" Function Keys ------------------------------------------------------------{{{
" Nasty hack to fix del key in st/Alacritty
map <F1> <del>
map! <F1> <del>
" vim paste mode toggle (for fixing indentation issues when pasting text)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
let hlstate=0
nnoremap <F3> :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<CR>
" indent whole file according to syntax rules
noremap <F9> gg=G
"}}}

" override read-only permissions
cmap w!! %!sudo tee > /dev/null %

