" vim:foldmethod=marker
set nocompatible
filetype off

" =====================================================
" Plugins --------------------------------------------- {{{

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'            " Vundle
Plugin 'christoomey/vim-tmux-navigator'  " Move between tmux and vim easily
Plugin 'tpope/vim-fugitive'              " Git plugin 
Plugin 'tpope/vim-commentary'            " Comments
Plugin 'tpope/vim-surround'              " Surrounding text
Plugin 'tpope/vim-vinegar'               " Explorer enhance
Plugin 'tweekmonster/django-plus.vim'    " Django Plugin
Plugin 'plasticboy/vim-markdown'         " Markdown plugin
Plugin 'vim-pandoc/vim-pandoc-syntax'    " Markdown plugin
Plugin 'jalvesaq/Nvim-R'                 " R plugin
Plugin 'ledger/vim-ledger'               " Ledger plugin
Plugin 'rcaputo/vim-ledger_x'            " Ledger plugin
Plugin 'mboughaba/i3config.vim'          " i3config syntax highlighting
Plugin 'python-mode/python-mode'         " Python plugin
Plugin 'Yggdroot/indentLine'             " Show indenting
Plugin 'masher2/readablefold.vim'        " Easier to read folding
call vundle#end()

filetype plugin indent on

" }}}

" =====================================================
" UI -------------------------------------------------- {{{

colorscheme bright
syntax on

" Vertical splits always
set diffopt+=vertical

" Split in sane directions
set splitbelow
set splitright

" Line numbers
set number
set relativenumber

" Etc 
set path+=**
set wildmenu
set showcmd
set noswapfile
set autoread

" Indent {{{

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround
set autoindent

let g:indentLine_enabled = 0
let g:indentLine_char = '▏'

"}}}

" Folding {{{

set foldenable
set foldmethod=indent
set foldnestmax=3
set foldlevel=0

" Readablefold characters
let g:readablefold#foldlevel_char = '<'
let g:readablefold#foldspace_char = ' '
let g:readablefold#tabstop_char = '-'

" }}}

" Cursorline {{{

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" }}}

" }}}

" =====================================================
" Plugin options and mappings ------------------------- {{{

" Netrw ----------------------------------------------- {{{

let g:netrw_liststyle = 3

" }}}

" R --------------------------------------------------- {{{

" Options {{{

let g:R_assign = 0
let R_csv_delim = ','
let R_csv_app = 'tmux split-window scim_or_calc'
let R_nvim_wd = 1
let r_syntax_folding = 1

" }}}
" Mappings {{{

" Pipe and assign
autocmd FileType R,r,rmd imap <buffer> <M-m> %>%
autocmd FileType R,r,rmd imap <buffer> <M--> <-

" Running R code
autocmd FileType R,r,rmd nmap <buffer>  \d
autocmd FileType R,r nmap <buffer> <M-CR> \pp
autocmd FileType rmd nmap <buffer> <M-CR> \cc
autocmd FileType R,r,rmd vmap <buffer> <M-CR> \ss

" }}}
" R help {{{

autocmd FileType R,r,rmd nmap <buffer> <F1> \rh
autocmd FileType Rdoc,rdoc setlocal nofoldenable
autocmd FileType rmd setlocal commentstring=#\ %s

" }}}

" }}}

" Python ---------------------------------------------- {{{

" Options {{{

let g:pymode_python = 'python3'
let g:pymode_lint_on_write = 0
let g:pymode_lint_signs = 0
let g:pymode_options_colorcolumn = 0

autocmd FileType python setlocal wrap

" }}}
" Mappings {{{

autocmd FileType python nnoremap <buffer> <M-J> :call pymode#motion#move('^\s*\(async\s\+\)\=def\s', '')<CR>
autocmd FileType python nnoremap <buffer> <M-K> :call pymode#motion#move('^\s*\(async\s\+\)\=def\s', 'b')<CR>

" }}}
" Django {{{

autocmd FileType htmldjango setlocal commentstring={#\ %s\ #}
autocmd FileType html,htmldjango setlocal nofoldenable
autocmd FileType html,htmldjango setlocal foldnestmax=30
autocmd FileType html,htmldjango :IndentLinesEnable

" }}}

" }}}

" }}}

" =====================================================
" Key bindings ---------------------------------------- {{{

" Unmodified keys ------------------------------------- {{{

" Make `Y` congruent with `D` and `C`
nnoremap Y y$

" }}}

" Leader ---------------------------------------------- {{{

" Easier file navigation
nnoremap <leader>e :edit **/*
nnoremap <leader>t :tabedit **/*
nnoremap <leader>/ :sp **/*
nnoremap <leader>\ :vsp **/*

" Easy copy to clipboard
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y

" Toggle indent lines
nnoremap <leader>il :IndentLinesToggle<CR>

" Set folding levels
noremap <leader>f0 :set foldlevel=0<CR>
noremap <leader>f1 :set foldlevel=1<CR>
noremap <leader>f2 :set foldlevel=2<CR>
noremap <leader>f3 :set foldlevel=3<CR>
noremap <leader>f4 :set foldlevel=4<CR>
noremap <leader>f5 :set foldlevel=5<CR>
noremap <leader>f6 :set foldlevel=6<CR>
noremap <leader>f7 :set foldlevel=7<CR>
noremap <leader>f8 :set foldlevel=8<CR>
noremap <leader>f9 :set foldlevel=9<CR>

" Git
nnoremap <silent> <leader>gg :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>ga :Gcommit --amend<CR>
nnoremap <silent> <leader>gA :Gcommit --amend --no-edit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <leader>gp :Gpush<CR>

" Window comands
nnoremap <leader>w <C-w>
nnoremap <leader>wz <C-w>_<C-w>\|
nnoremap <leader>w\ :vertical resize 80<Cr>
nnoremap <leader>w, 10<C-w><
nnoremap <leader>w. 10<C-w>>

" }}}

" Control --------------------------------------------- {{{

" Easy split navigation and tmux integration
nnoremap <silent> <C-H> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-J> :TmuxNavigateDown<CR>
nnoremap <silent> <C-K> :TmuxNavigateUp<CR>
nnoremap <silent> <C-L> :TmuxNavigateRight<CR>

" }}}

" Alt ------------------------------------------------- {{{

" Easy tab switching
nnoremap <M-h> :tabprevious<CR>
nnoremap <M-l> :tabnext<CR>

" Easier scrolling
nnoremap <M-k> <C-u>
nnoremap <M-j> <C-d>

" Alternate saving and quitting
nnoremap <M-w> :w<cr>
nnoremap <M-q> :q<cr>

" }}}

" Other ----------------------------------------------- {{{

" Easier folding
nnoremap <Space> za
nnoremap <M-Space> zA

" Scaping insert mode
inoremap <M-Space> <Esc>
" }}}

" }}}
