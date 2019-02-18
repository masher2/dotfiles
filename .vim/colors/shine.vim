"these lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
    syntax reset
endif

"Load the 'base' colorscheme - the one you want to alter
runtime colors/ron.vim

"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "shine"
set background=dark

" Clear highlight groups -----------------------------------------------
hi clear Search
hi clear CursorLine
hi clear Folded

hi clear StatusLine
hi clear StatusLineNC
hi clear VertSplit 
hi clear TabLine 
hi clear TabLineFill 
hi clear TabLineSel 

hi clear DiffAdd
hi clear DiffChange
hi clear DiffDelete
hi clear DiffText

"
" Add highlighting ----------------------------------------------------
hi Search       ctermbg=8
hi CursorLine   cterm=NONE ctermbg=0
hi Folded       ctermbg=0 ctermfg=12

" Status line ----------------------------------------------------------
hi StatusLine   ctermbg=44 ctermfg=233
hi StatusLineNC ctermbg=238 ctermfg=44
hi VertSplit    ctermbg=NONE ctermfg=240

" Tab line -------------------------------------------------------------
hi TabLine      ctermbg=233 ctermfg=250
hi TabLineFill  ctermbg=232
hi TabLineSel   ctermbg=235 ctermfg=255

" Diffs ----------------------------------------------------------------
highlight DiffAdd    cterm=NONE ctermfg=15 ctermbg=22
highlight DiffDelete cterm=NONE ctermfg=15 ctermbg=88
highlight DiffChange cterm=NONE ctermfg=15 ctermbg=17
highlight DiffText   cterm=NONE ctermfg=15 ctermbg=27
