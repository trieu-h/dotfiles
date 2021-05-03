" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<silent><C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + 7890 to resize windows
" TODO find a better mapping for this
" nnoremap <Leader>7    :resize +2<CR>
" nnoremap <Leader>0    :vertical resize -2<CR>
" nnoremap <Leader>9    :vertical resize +2<CR>
" nnoremap <Leader>8    :resize -2<CR>

" I hate escape more than anything else
inoremap jj <Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Insert newline by pressing enter
nmap <S-CR> O<Esc>
nmap <CR> o<Esc>

" Disable highlight after searching
nmap <F2> :nohl<CR>

" Quick fix remap (s/o theprimeagen)
let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:the_primeagen_qf_g == 1
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_g = 1
            copen
        end
    else
        if g:the_primeagen_qf_l == 1
            let g:the_primeagen_qf_l = 0
            lclose
        else
            let g:the_primeagen_qf_l = 1
            lopen
        end
    endif
endfun

nnoremap <leader>q :call ToggleQFList(1)<CR>
nnoremap <leader>k :cnext<CR>zz
nnoremap <leader>j :cprev<CR>zz
