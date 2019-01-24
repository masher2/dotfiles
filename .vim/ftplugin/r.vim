" R tmux
let R_source = '~/.vim/bundle/Nvim-R/R/tmux_split.vim'
let R_csv_delim = ','
let R_csv_app = 'tmux split-window scim_or_calc'

" Pipes and assignments
imap <M-m> %>%
imap <M--> <-

" Running code as in RStudio
nmap <buffer>  \d
nmap <buffer> <M-CR> \pp
vmap <buffer> <M-CR> \ss

" Rhelp
nmap <buffer> <F1> \rh
