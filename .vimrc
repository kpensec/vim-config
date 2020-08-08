set nocompatible              " be iMproved, required
let mapleader = ","

call plug#begin('~/.vim/plugged')
source $HOME/.vim/plugin_list.vim
call plug#end()

filetype plugin indent on    " required
syntax on
colorscheme gruvbox
set background=dark

let g:airline_powerline_fonts = 1

set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨

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
set statusline+=%*

autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

nmap <leader>h :noh<CR>
nmap <F3> :Lexplore<CR>
nmap <F9> :call StripTrailingWhitespace()<CR><C-O>

" execute current buffer as python script
nmap <F5> :w<CR>:!clear;python %<CR>

set backupcopy=yes

" netrw configuration
let g:netrw_browse_split = 0
let g:netrw_winsize = 25
let g:netrw_liststyle = 3


let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'} " icons require GUI
let g:lsp_signs_hint = {'text': '?'} " icons require GUI
let g:lsp_diagnostics_echo_delay = 200

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <leader>d <plug>(lsp-definition)
    nmap <leader>k <plug>(lsp-hover)
    nmap <leader>rn <plug>(lsp-rename)
    nmap <leader>n <plug>(lsp-next-diagnostic)
    nmap <leader>p <plug>(lsp-previous-diagnostic)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

