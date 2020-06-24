" vim:foldmethod=marker
set mouse=a

filetype off

" =====================================================
" Plugins --------------------------------------------- {{{

set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin('~/.config/nvim/bundle/')
Plugin 'VundleVim/Vundle.vim'            " Vundle
Plugin 'christoomey/vim-tmux-navigator'  " Move between tmux and vim easily
Plugin 'tpope/vim-fugitive'              " Git
Plugin 'tpope/vim-commentary'            " Comments
Plugin 'tpope/vim-surround'              " Surrounding text
Plugin 'tpope/vim-vinegar'               " Explorer enhance
Plugin 'tweekmonster/django-plus.vim'    " Django
Plugin 'sheerun/vim-polyglot'            " Syntax highlighting
Plugin 'vim-pandoc/vim-pandoc-syntax'    " Markdown
Plugin 'jalvesaq/Nvim-R'                 " R
Plugin 'ledger/vim-ledger'               " Ledger
Plugin 'rcaputo/vim-ledger_x'            " Ledger
Plugin 'python-mode/python-mode'         " Python
Plugin 'davidhalter/jedi-vim'            " Python completion
Plugin 'Yggdroot/indentLine'             " Show indenting
Plugin 'masher2/readablefold.vim'        " Easier to read folding
Plugin 'jceb/vim-orgmode'                " Orgmode
Plugin 'mattn/calendar-vim'              " Calendar
Plugin 'ap/vim-css-color'                " Hexadecimal color hints
Plugin 'vimwiki/vimwiki'                 " Personal knowledge base
Plugin 'junegunn/fzf'
Plugin 'dylanaraps/fff.vim'
Plugin 'goerz/jupytext.vim'
Plugin 'file:///home/masher2/work/Jesus/blogdown.vim/', {'pinned': 1}
call vundle#end()

filetype plugin indent on

" }}}

" =====================================================
" UI -------------------------------------------------- {{{

colorscheme shine
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
set noswapfile

" Allow window split borders to touch.
set winminheight=0
set winminwidth=0

" Indent {{{

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround

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

" vim-calendar ---------------------------------------- {{{

autocmd FileType calendar setlocal nonumber norelativenumber
autocmd FileType calendar setlocal nofoldenable

" }}}

" vim-tmux-navigator ---------------------------------- {{{

 let g:tmux_navigator_disable_when_zoomed = 1

" }}}

" vim-polyglot ---------------------------------------- {{{

 let g:polyglot_disabled = ['r-lang', 'python', 'tmux']

" }}}

" Orgmode --------------------------------------------- {{{

let g:org_todo_keywords=['TODO', 'DOING', '|', 'DONE']
let g:org_indent = 1

" }}}

" Netrw ----------------------------------------------- {{{

let g:netrw_liststyle = 3

" }}}

" R --------------------------------------------------- {{{

" Options {{{

let g:R_assign = 0
let R_csv_delim = ','
let R_csv_app = 'tmux split-window scim_or_calc'
let R_nvim_wd = 1
let R_esc_term = 0
let R_hl_term = 1
let r_indent_align_args = 0
let r_syntax_folding = 1
let rout_follow_colorscheme = 1
let R_start_libs = 'base,stats,graphics,grDevices,utils,methods,readr,dplyr,magrittr,ggplot2,lubridate,tidyr'
autocmd FileType R,r,rmd,Rmd set tabstop=2 shiftwidth=2 softtabstop=2

" }}}
" Mappings {{{

" Pipe and assign
autocmd FileType R,r,rmd imap <buffer> <M-m> %>%
autocmd FileType R,r,rmd imap <buffer> <M--> <-

" Running R code
autocmd FileType R,r,rmd nmap <buffer> <CR> \l
autocmd FileType R,r nmap <buffer> <M-CR> \pp
autocmd FileType rmd nmap <buffer> <M-CR> \cc
autocmd FileType R,r,rmd vmap <buffer> <M-CR> \ss

" Moving between function declarations
" Got this from python-mode
fun! RFuncionMove(flags, ...) "{{{
    let cnt = v:count1 - 1
    let [line, column] = searchpos('^[A-z0-9_.]\+\s\=\(<-\|=\)\s\=function', a:flags . 'sW')
    let indent = indent(line)
    while cnt && line
        let [line, column] = searchpos('^[A-z0-9_.]\+\s\=\(<-\|=\)\s\=function', a:flags . 'W')
        if indent(line) == indent
            let cnt = cnt - 1
        endif
    endwhile
    return [line, column]
endfunction "}}}

autocmd FileType R,r,rmd nnoremap <buffer> <M-J> :call RFuncionMove('')<CR>
autocmd FileType R,r,rmd nnoremap <buffer> <M-K> :call RFuncionMove('b')<CR>

" }}}
" R help {{{

autocmd FileType R,r,rmd nmap <buffer> <F1> \rh
autocmd FileType Rdoc,rdoc,rbrowser setlocal nofoldenable nonumber norelativenumber
autocmd FileType rmd setlocal commentstring=#\ %s

" }}}
" Blogdown {{{

let g:blogdown_content_dir = 'content'
let g:blogdown_blogs = ['~/work/Jesus/masher2-blog/']

" }}}

" }}}

" Python ---------------------------------------------- {{{

" Options {{{

let g:pymode_python = 'python3'
let g:pymode_lint_on_write = 0
let g:pymode_lint_signs = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_breakpoint_cmd = 'breakpoint()'
let g:jedi#use_splits_not_buffers = 'winwidth'
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0

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
autocmd FileType html,htmldjango set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType xml,css,sass,scss set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript set tabstop=2 shiftwidth=2 softtabstop=2

" }}}
" Ipython {{{

" let g:jupytext_filetype_map = {'md': 'pandoc'}

" }}}

" }}}

" Ledger ---------------------------------------------- {{{

autocmd FileType ledger set tabstop=2 shiftwidth=2 softtabstop=2

" }}}

" Vimwiki --------------------------------------------- {{{

let g:vimwiki_list = [{'path': '~/Documents/wiki/'}]
let g:vimwiki_global_ext = 0

" }}}

" FZF ------------------------------------------------- {{{

let g:fzf_layout = {'window': {'width': 0.5, 'height': 0.5, 'yoffset': 1, 'xoffset': 0.1, 'border': 'bottom'}}

let g:fzf_colors =
\ { 'fg':      ['fg', 'Pmenu'],
  \ 'bg':      ['bg', 'Pmenu'],
  \ 'hl':      ['fg', 'Pmenu'],
  \ 'fg+':     ['fg', 'PmenuSel'],
  \ 'bg+':     ['bg', 'PmenuSel'],
  \ 'hl+':     ['fg', 'PmenuSel'],
  \ 'border':  ['fg', 'Pmenu'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" }}}

" fff ------------------------------------------------- {{{

let g:fff#split='new'

if empty(maparg('-', 'n'))
    nmap - :F %:h<CR>
endif

" }}}

" }}}

" =====================================================
" Key bindings ---------------------------------------- {{{

" Unmodified keys ------------------------------------- {{{

" Make `Y` congruent with `D` and `C`
nnoremap Y y$

" Redo with `U`
nnoremap U <C-r>

" }}}

" Leader ---------------------------------------------- {{{

" Easier file navigation
nnoremap <leader>e :call fzf#run(fzf#wrap({'sink': 'e'}))<CR>
nnoremap <leader>t :call fzf#run(fzf#wrap({'sink': 'tabedit'}))<CR>
nnoremap <leader>/ :call fzf#run(fzf#wrap({'sink': 'sp'}))<CR>
nnoremap <leader>\ :call fzf#run(fzf#wrap({'sink': 'vsp'}))<CR>

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

" diffs
nnoremap <leader>dt :diffthis<CR>
nnoremap <leader>do :diffoff<CR>

" Window comands
nnoremap <leader>w <C-w>
nnoremap <leader>wz <C-w>_<C-w>\|
nnoremap <leader>w\ :exec "vertical resize " (&numberwidth + 80)<CR>
nnoremap <leader>w/ :resize 40<CR>
nnoremap <leader>w, 10<C-w><
nnoremap <leader>w. 10<C-w>>

" Edit my orgfiles
nnoremap <leader>o\ :vsp ~/Documents/notes.org<CR>
nnoremap <leader>o/ :sp ~/Documents/notes.org<CR>
nnoremap <leader>p\ :vsp notes.org<CR>
nnoremap <leader>p/ :sp notes.org<CR>

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

"======================================================
" Terminal options and mappings ----------------------- {{{
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
nnoremap <C-Space> <Esc>

" Enter terminal in terminal mode
autocmd BufEnter term://* :startinsert

" }}}

" =====================================================
" Custom commands ------------------------------------- {{{

" Transform youtube file titles into markdown links
command! Ytitle s~\s*\(.\+\)-\([A-z0-9_]\{11}\)\.\w\{3}$~[[video] \1](https://www.youtube.com/watch?v=\2)

" }}}

