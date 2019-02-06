set nocompatible
filetype off


" Vundle config
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'            " Vundle
Plugin 'christoomey/vim-tmux-navigator'  " Move between tmux and vim easily
Plugin 'tpope/vim-fugitive'              " Git plugin 
Plugin 'tpope/vim-commentary'            " Comments
Plugin 'tpope/vim-surround'              " Surrounding text
Plugin 'tpope/vim-vinegar'               " Explorer enhance
Plugin 'tweekmonster/django-plus.vim'    " Django Plugin
" Plugin 'plasticboy/vim-markdown'        " Markdown plugin
Plugin 'vim-pandoc/vim-pandoc-syntax'    " Markdown plugin
Plugin 'jalvesaq/Nvim-R'                 " R plugin
Plugin 'ledger/vim-ledger'               " Ledger plugin
Plugin 'rcaputo/vim-ledger_x'            " Ledger plugin
Plugin 'mboughaba/i3config.vim'          " i3config syntax highlighting
Plugin 'python-mode/python-mode'         " Python plugin
Plugin 'nathanaelkane/vim-indent-guides' " Show indenting

call vundle#end()
filetype plugin indent on


" Files navigation
set path+=**
set wildmenu
nnoremap <leader>e :edit **/*
nnoremap <leader>t :tabedit **/*
nnoremap <leader>/ :sp **/*
nnoremap <leader>\ :vsp **/*


" Screen
colorscheme shine

set number
set relativenumber
set showcmd


" Diff options
set diffopt+=vertical


" Extras
set noswapfile
set autoread
set splitbelow
set splitright


" Split screen navigation
nnoremap <silent> <C-H> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-J> :TmuxNavigateDown<CR>
nnoremap <silent> <C-K> :TmuxNavigateUp<CR>
nnoremap <silent> <C-L> :TmuxNavigateRight<CR>


" Tab navigation
nnoremap <M-h> :tabprevious<CR>
nnoremap <M-l> :tabnext<CR>


" Arrow navigation
nnoremap <M-k> <C-u>
nnoremap <M-j> <C-d>


syntax on


" Folding
set foldmethod=indent
set foldnestmax=3
set foldenable "Start with the folded code
set foldlevel=0


" Indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround
set autoindent

" File browser
let g:netrw_liststyle = 3

autocmd FileType markdown setlocal filetype=markdown.pandoc

"================================================
" R options and mappings
let g:R_assign = 0
let R_csv_delim = ','
let R_csv_app = 'tmux split-window scim_or_calc'
let R_nvim_wd = 1
let r_syntax_folding = 1

" Abbreviations
" TODO: Use vim abbreviations
autocmd FileType R,r,rmd imap <buffer> <M-m> %>%
autocmd FileType R,r,rmd imap <buffer> <M--> <-

" Running R code
autocmd FileType R,r,rmd nmap <buffer>  \d
autocmd FileType R,r,rmd nmap <buffer> <M-CR> \pp
autocmd FileType R,r,rmd vmap <buffer> <M-CR> \ss
autocmd FileType rmd nmap <buffer> <M-CR> \cc

" R help
autocmd FileType R,r,rmd nmap <buffer> <F1> \rh
autocmd FileType Rdoc,rdoc setlocal nofoldenable
autocmd FileType rmd setlocal commentstring=#\ %s
" autocmd FileType R,r,rmd setlocal nofoldenable


"================================================
" Python options and mappings
let g:pymode_python = 'python3'
let g:pymode_lint_on_write = 0
let g:pymode_lint_signs = 0
let g:pymode_options_colorcolumn = 0

autocmd FileType python setlocal wrap
autocmd FileType python nnoremap <buffer> <M-J> :call pymode#motion#move('^\s*\(async\s\+\)\=def\s', '')<CR>
autocmd FileType python nnoremap <buffer> <M-K> :call pymode#motion#move('^\s*\(async\s\+\)\=def\s', 'b')<CR>

"================================================
" Django templates options and mappings
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0

autocmd FileType htmldjango setlocal commentstring={#\ %s\ #}
autocmd FileType html,htmldjango setlocal nofoldenable
autocmd FileType html,htmldjango setlocal foldnestmax=30
autocmd FileType html,htmldjango :IndentGuidesEnable
