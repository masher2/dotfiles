" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2006 Apr 15

" This color scheme uses a light grey background.

" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "bright"

hi clear DiffAdd
hi clear DiffChange
hi clear DiffDelete
hi clear DiffText
hi clear FoldColumn
hi clear Folded
hi clear Search
hi clear StatusLine
hi clear StatusLineNC
hi clear VertSplit
hi clear TabLine
hi clear TabLineFill


" Groups used in the 'highlight' and 'guicursor' options default value.
" hi Cursor       guibg=Green guifg=NONE
" hi CursorColumn ctermbg=grey guibg=grey80
" hi CursorLine   cterm=underline guibg=grey80
hi DiffAdd      cterm=NONE ctermbg=LightBlue ctermfg=15
hi DiffChange   cterm=NONE ctermbg=LightMagenta ctermfg=15
hi DiffDelete   cterm=NONE ctermbg=Red ctermfg=15
hi DiffText     cterm=NONE ctermbg=LightCyan ctermfg=15
" hi Directory    ctermfg=DarkBlue guifg=Blue
" hi ErrorMsg     ctermfg=White ctermbg=DarkRed guibg=Red guifg=White
hi FoldColumn   ctermbg=Grey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
hi Folded       ctermbg=Grey ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
" hi IncSearch    cterm=reverse gui=reverse
" hi LineNr       ctermfg=Brown guifg=Brown
" hi ModeMsg      cterm=bold gui=bold
" hi MoreMsg      ctermfg=DarkGreen gui=bold guifg=SeaGreen
" hi NonText      ctermfg=Blue gui=bold guifg=Blue guibg=grey80
" hi Normal ctermfg=White guifg=Black guibg=grey90
" hi Question     ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi Search       cterm=reverse 
" hi SpecialKey   ctermfg=DarkBlue guifg=Blue
" hi Title        ctermfg=DarkMagenta gui=bold guifg=Magenta
hi StatusLine   cterm=reverse ctermfg=14 ctermbg=0 
hi StatusLineNC ctermfg=10 ctermbg=0
hi VertSplit    ctermfg=0 ctermbg=10 cterm=NONE
hi TabLine      ctermbg=0 ctermfg=14 cterm=NONE
hi TabLineFill  ctermfg=0 cterm=NONE
" hi TabLineSel   ctermbg=235 ctermfg=255
" hi Visual       ctermbg=grey guibg=grey80
" hi VisualNOS    cterm=underline,bold gui=underline,bold
" hi WarningMsg   ctermfg=DarkRed guifg=Red
" hi WildMenu     ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
" hi lCursor      guibg=Cyan guifg=NONE

" Colors for syntax highlighting
" hi Constant ctermfg=DarkRed guifg=Magenta guibg=grey95
" hi Special ctermfg=DarkMagenta guifg=SlateBlue guibg=grey95
" if &t_Co > 8
"   hi Statement cterm=bold ctermfg=Brown gui=bold guifg=Brown
" endif
" hi Ignore ctermfg=LightGrey guifg=grey90

" vim: sw=2

