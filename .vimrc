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
autocmd FileType ruby :set tabstop=2
autocmd FileType ruby :set shiftwidth=2
autocmd BufEnter Vagrantfile set filetype=ruby
autocmd BufEnter Rakefile set filetype=ruby

autocmd FileType javascript :set tabstop=2
autocmd FileType javascript :set shiftwidth=2

autocmd FileType html :set tabstop=2
autocmd FileType html :set shiftwidth=2

autocmd FileType css :set tabstop=2
autocmd FileType css :set shiftwidth=2

autocmd FileType dot :set tabstop=2
autocmd FileType dot :set shiftwidth=2

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

" exit vim with an error code
" from http://stackoverflow.com/questions/2786619/how-do-you-cancel-an-external-git-diff
if &diff
  map Q :cquit!<CR>
  map q :cquit!<CR>
endif

let g:vim_markdown_folding_disabled=1

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
augroup WhitespaceMatch
  " Remove ALL autocommands for the WhitespaceMatch group.
  autocmd!
  autocmd BufWinEnter * let w:whitespace_match_number =
        \ matchadd('ExtraWhitespace', '\s\+$')
  autocmd InsertEnter * call s:ToggleWhitespaceMatch('i')
  autocmd InsertLeave * call s:ToggleWhitespaceMatch('n')
augroup END
function! s:ToggleWhitespaceMatch(mode)
  let pattern = (a:mode == 'i') ? '\s\+\%#\@<!$' : '\s\+$'
  if exists('w:whitespace_match_number')
    call matchdelete(w:whitespace_match_number)
    call matchadd('ExtraWhitespace', pattern, 10, w:whitespace_match_number)
  else
    " Something went wrong, try to be graceful.
    let w:whitespace_match_number =  matchadd('ExtraWhitespace', pattern)
  endif
endfunction
