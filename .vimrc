set nocompatible              " be iMproved, required
filetype off                  " required

silent function! Windows()
  return  (has('win32') || has('win64'))
endfunction

if Windows()
  language en
  set encoding=utf-8

  set rtp=$HOME/.vim,$VIMRUNTIME/vimfiles,$VIMRUNTIME
  set rtp+=$VIMRUNTIME/vimfiles/after,~/.vim/after
else
  language en_US.utf8
endif

call plug#begin()
source $HOME/.vim/plugin_list.vim
call plug#end()            " required

filetype plugin indent on    " required
syntax on

let g:airline_powerline_fonts = 1

if has('gui')
  " bugged :(
  "set showbreak=âª
  "set listchars=tab:â\ ,eol:â²,nbsp:â£,trail:â¢,extends:â©,precedes:â¨
  set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
  " hi clear NonText
else
  " TODO
endif

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
