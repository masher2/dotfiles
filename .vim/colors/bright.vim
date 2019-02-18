" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2006 Apr 15

" This color scheme uses a light grey background.
set background=light

" First remove all existing highlighting.
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "bright"

" Clear highlight groups -----------------------------------------------
hi clear Search
hi clear Folded
hi clear FoldColumn
hi clear CursorLine

hi clear StatusLine
hi clear StatusLineNC
hi clear VertSplit

hi clear TabLine
hi clear TabLineFill
hi clear TabLineSel

hi clear Pmenu
hi clear PmenuSel
hi clear PmenuSbar
hi clear PmenuThumb

hi clear DiffAdd
hi clear DiffChange
hi clear DiffDelete
hi clear DiffText


" Add highlighting ----------------------------------------------------
hi Search       ctermbg=8
hi Folded       ctermbg=0 ctermfg=12
hi FoldColumn   ctermbg=0 ctermfg=12
hi CursorLine   cterm=NONE ctermbg=0

" Status line ----------------------------------------------------------
hi StatusLine   cterm=reverse ctermbg=0 ctermfg=14
hi StatusLineNC ctermbg=0 ctermfg=14
hi VertSplit    cterm=NONE ctermbg=NONE ctermfg=14

" Tab line -------------------------------------------------------------
hi TabLine      cterm=underline ctermbg=0 ctermfg=11
hi TabLineFill  cterm=underline ctermbg=0 ctermfg=11
hi TabLineSel   cterm=NONE ctermbg=8 ctermfg=14

" Pop up menu ----------------------------------------------------------
hi Pmenu        cterm=NONE ctermbg=7 ctermfg=11
hi PmenuSel     cterm=NONE ctermbg=0 ctermfg=14
hi PmenuSbar    cterm=NONE ctermbg=11 ctermfg=0
hi PmenuThumb   cterm=NONE ctermbg=15 ctermfg=11

" Diffs ----------------------------------------------------------------
hi DiffAdd      cterm=NONE ctermbg=LightBlue ctermfg=15
hi DiffChange   cterm=NONE ctermbg=LightMagenta ctermfg=15
hi DiffDelete   cterm=NONE ctermbg=Red ctermfg=15
hi DiffText     cterm=NONE ctermbg=LightCyan ctermfg=15

" hi Cursor       guibg=Green guifg=NONE
" hi CursorColumn ctermbg=grey guibg=grey80
" hi Directory    ctermfg=DarkBlue guifg=Blue
" hi ErrorMsg     ctermfg=White ctermbg=DarkRed guibg=Red guifg=White
" hi IncSearch    cterm=reverse gui=reverse
" hi LineNr       ctermfg=Brown guifg=Brown
" hi ModeMsg      cterm=bold gui=bold
" hi MoreMsg      ctermfg=DarkGreen gui=bold guifg=SeaGreen
" hi NonText      ctermfg=Blue gui=bold guifg=Blue guibg=grey80
" hi Normal ctermfg=White guifg=Black guibg=grey90
" hi Question     ctermfg=DarkGreen gui=bold guifg=SeaGreen
" hi SpecialKey   ctermfg=DarkBlue guifg=Blue
" hi Title        ctermfg=DarkMagenta gui=bold guifg=Magenta
" hi Visual       ctermbg=grey guibg=grey80
" hi VisualNOS    cterm=underline,bold gui=underline,bold
" hi WarningMsg   ctermfg=DarkRed guifg=Red
" hi WildMenu     ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
" hi lCursor      guibg=Cyan guifg=NONE
"
" Colors for syntax highlighting
" hi Constant ctermfg=DarkRed guifg=Magenta guibg=grey95
" hi Special ctermfg=DarkMagenta guifg=SlateBlue guibg=grey95
" if &t_Co > 8
"   hi Statement cterm=bold ctermfg=Brown gui=bold guifg=Brown
" endif
" hi Ignore ctermfg=LightGrey guifg=grey90
" vim: sw=2
