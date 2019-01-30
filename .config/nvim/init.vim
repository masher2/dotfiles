set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set mouse=a

"================================================
" Terminal options and mappings
autocmd TermOpen * setlocal nonumber
autocmd TermOpen * setlocal norelativenumber

" Open terminal splits like in tmux
nnoremap <leader>b/ :sp term://bash<CR>
nnoremap <leader>b\ :vsp term://bash<CR>

" Terminal navigation
tnoremap <silent> <C-H> <C-\><C-n>:TmuxNavigateLeft<CR>
tnoremap <silent> <C-J> <C-\><C-n>:TmuxNavigateDown<CR>
tnoremap <silent> <C-K> <C-\><C-n>:TmuxNavigateUp<CR>
tnoremap <silent> <C-L> <C-\><C-n>:TmuxNavigateRight<CR>
tnoremap <M-h> <C-\><C-n>:tabprevious<CR>
tnoremap <M-l> <C-\><C-n>:tabnext<CR>

" Exiting terminal mode
tnoremap <C-Space> <C-\><C-n>

" Enter terminal in terminal mode
autocmd BufEnter term://* :startinsert
