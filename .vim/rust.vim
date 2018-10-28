set hidden
let g:rustfmt_autosave = 1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

au FileType rust nmap <F4> :make! build --release<CR>
au FileType rust nmap <F5> :make! run --release<CR>
au FileType rust nmap <F6> :make! test --release<CR>
au FileType rust nmap <F7> :make! test --release -- --nocapture<CR>

autocmd BufWritePre *.rs call StripTrailingWhitespace()

