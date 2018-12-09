" R tmux
let R_source = '~/.vim/bundle/Nvim-R/R/tmux_split.vim'
let R_csv_delim = ','
let R_csv_app = 'tmux split-window csv_dispatcher.sh'

" Pipes and assignments
imap <M-m> %>%
let R_assign_map = <M-->

" Running code as in RStudio
nmap <buffer>  \d
nmap <buffer> <M-CR> \pp
vmap <buffer> <M-CR> \ss

" Rhelp
nmap <buffer> <F1> \rh
