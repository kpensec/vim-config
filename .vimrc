set nocompatible              " be iMproved, required
filetype off                  " required
language en_US.utf8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
source $HOME/.vim/plugin_list.vim
call vundle#end()            " required

filetype plugin indent on    " required
syntax on

function! StripTrailingWhitespace()
  normal mZ
  let l:chars = col("$")
  %s/\s\+$//e
  if (line("'Z") != line(".")) || (l:chars != col("$"))
    echo "Trailing whitespace stripped\n"
  endif
  normal `Z
endfunction

set foldmethod=syntax
set foldlevel=99

set number
set expandtab
set tabstop=2
set shiftwidth=2

set incsearch
set hlsearch

set autowrite
set autoread

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Utilities shortcuts:

nmap <F3> :NERDTreeToggle<CR>
nmap <F9> :call StripAllWhiteSpace()<CR><C-O>

source $HOME/.vim/rust.vim

"let g:airline_symbols_ascii = 1
let g:airline_powerline_fonts = 1


let g:startify_lists = [
      \ { 'type': 'sessions',  'header': [   'Sessions']       },
      \ { 'type': 'files',     'header': [   'MRU']            },
      \ { 'type': 'bookmarks', 'header': [   'Bookmarks']      },
      \ { 'type': 'commands',  'header': [   'Commands']       },
      \ ]

autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
