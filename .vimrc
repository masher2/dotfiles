set nocompatible
filetype off


" Vundle config
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'           " Vundle
Plugin 'christoomey/vim-tmux-navigator' " Move between tmux and vim easily
Plugin 'tpope/vim-fugitive'             " Git plugin 
Plugin 'tpope/vim-commentary'           " Comments
Plugin 'tpope/vim-surround'             " Surrounding text
Plugin 'tpope/vim-vinegar'              " Explorer enhance
Plugin 'tweekmonster/django-plus.vim'   " Django Plugin
Plugin 'plasticboy/vim-markdown'        " Markdown plugin
Plugin 'jalvesaq/Nvim-R'                " R plugin

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
colorscheme masher
set number
set relativenumber
set showcmd
set background=dark "This is for getting my colors right on tmux
set t_Co=256        "This is for getting my colors right on tmux


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
let g:netrw_liststyle=3

