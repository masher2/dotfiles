set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set mouse=a

" Terminal navigation
tnoremap <silent> <C-H> <C-\><C-n>:TmuxNavigateLeft<CR>
tnoremap <silent> <C-J> <C-\><C-n>:TmuxNavigateDown<CR>
tnoremap <silent> <C-K> <C-\><C-n>:TmuxNavigateUp<CR>
tnoremap <silent> <C-L> <C-\><C-n>:TmuxNavigateRight<CR>


