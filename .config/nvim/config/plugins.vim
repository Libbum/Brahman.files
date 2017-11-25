" deoplete
let g:deoplete#enable_at_startup = 1

" neomake
let g:neomake_highlight_lines = 1
"let g:neomake_highlight_columns = 0
augroup my_neomake_highlights
    au!
    autocmd ColorScheme *
        \ hi link NeomakeError SpellBad
        \ hi link NeomakeWarning SpellCap
augroup END

" rust settings
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let $RUST_SRC_PATH="/usr/src/rust/src"
autocmd BufWritePost *.rs Neomake cargo
let g:rust_fold = 1
"let g:rustfmt_autosave = 1

" latex
" At the moment reverse syntex isn't completely inside neovim
" Must use mhinz/neovim-remote python thingy, ie. nvr and
" set export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
let g:tex_flavor = 'latex'
let g:vimtex_latexmk_progname = 'nvr'
"let g:vimtex_view_use_temp_files = 1
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

" pandoc
let b:pandoc_command_autoexec_command = ':Pandoc #notes'
" dont overwrite my keys kthx
let g:pandoc#keyboard#display_motions = 0

" elm
" We disable the polyglot values in favour of elm-vim
let g:polyglot_disabled = ['elm']

" fzf
" use ripgrep for fuzzy search. We respect the .gitignore for this one
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always"
  \ -g "*.{js,json,elm,md,rs,html,css,py,cpp,c,yaml,hs,tex,conf}"
  \ -g "!{.git,.vagrant,target,node_modules,vendor,elm-stuff}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
