map  :w!<CR>:!aspell --dont-backup --mode=email check %<CR>:e! %<CR>
map  :w!<CR>:!aspell --dont-backup --mode=tex check %<CR>:e! %<CR>

set noautoindent
set expandtab
set tabstop=4
set shiftwidth=4
set ruler
set ignorecase

syntax on
filetype on
autocmd FileType c :set cindent
autocmd FileType perl :set cindent
autocmd FileType perl :set cindent
autocmd BufEnter *.t set filetype=perl

execute pathogen#infect()
 
" make highlighted comments a lighter blue
hi Comment guifg=#FF0000
hi Comment ctermfg=lightblue
hi String ctermfg=red
 
" backspace behavor
set bs=indent,eol,start
 
" show matching curly
set sm

" write to any file (even readonly)
"set writeany

" what the heck does this do?
map @r 0O....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8

:ab #c # Copyright (C) 2005  Joshua Hoblitt<NL>#<NL># $Id$

set guifont=Monospace\ 14

" Paste Mode On/Off
map <F11> :call Paste_on_off()<CR>
set pastetoggle=<F11>

let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
    if g:paste_mode == 0
        set paste
        let g:paste_mode = 1
    else
        set nopaste
        let g:paste_mode = 0
    endif  
    return
endfunc

" Clear search highlighting
map <F12> :nohlsearch<CR>
