" Vim color file
" Maintainer:	Thorsten Maerz <info@netztorte.de>
" Last Change:	2006 Dec 07
" grey on black
" optimized for TFT panels

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "torte"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight Normal     guifg=Grey80	guibg=Black
highlight Search     guifg=Black	guibg=Red	gui=bold
highlight Visual     guifg=#404040			gui=bold
highlight Cursor     guifg=Black	guibg=Green	gui=bold
highlight Special    guifg=Orange
highlight Comment    guifg=#80a0ff
highlight StatusLine guifg=blue		guibg=white
highlight Statement  guifg=Yellow			gui=NONE
highlight Type						gui=NONE

" Console
" fix by jameskid 2016.3.1
" highlight Normal     ctermfg=LightGrey	ctermbg=Black
" highlight Normal     ctermfg=khaki	ctermbg=grey20
highlight Search     ctermfg=Black	ctermbg=Red	cterm=NONE
highlight Visual					cterm=reverse
"highlight Cursor     ctermfg=Black	ctermbg=Green	cterm=bold
highlight Cursor     ctermfg=Black	ctermbg=Black	cterm=bold
highlight Special    ctermfg=Brown
highlight Comment    ctermfg=Blue
" 状态栏 add by jameskid 2016.3.2
highlight StatusLine ctermfg=Black	ctermbg=White
highlight Statement  ctermfg=Yellow			cterm=NONE
highlight StatusLineNC	gui=NONE	guifg=black guibg=black	ctermfg=darkBlue  ctermbg=White
highlight StatusLine	gui=bold	guifg=cyan	guibg=blue	ctermfg=Black   ctermbg=White
" 行数颜色
" highlight LineNr		guifg=Black		ctermfg=blackGreen
" 标签栏 add by jameskid 2016.3.2
hi Normal		guifg=yellow	guibg=darkBlue
" 分割线颜色 add by jameskid 2016.3.2
hi VertSplit	ctermfg=Black	ctermbg=Black 
" 目录颜色
" hi Directory	ctermfg=White	ctermbg=White 
" 下拉选中颜色 add by jameskid 2016.3.25
hi PmenuSel ctermfg=White	ctermbg=darkBlue
" 下拉选单颜色 add by jameskid 2016.3.25 
hi Pmenu      ctermfg=lightGreen ctermbg=Black
" 未知
hi DiffAdd    ctermbg=LightBlue    guibg=LightBlue
hi DiffChange ctermbg=LightMagenta guibg=LightMagenta
hi DiffDelete ctermfg=Blue	   ctermbg=LightCyan gui=bold guifg=Blue guibg=LightCyan
hi DiffText   ctermbg=Red	   cterm=bold gui=bold guibg=Red
hi FoldColumn ctermfg=DarkBlue	   ctermbg=Grey     guibg=Grey	    guifg=DarkBlue
hi Folded     ctermbg=Grey	   ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi IncSearch  cterm=reverse	   gui=reverse
hi ModeMsg    cterm=bold	   gui=bold
hi MoreMsg    ctermfg=DarkGreen    gui=bold guifg=SeaGreen
hi NonText    ctermfg=Blue	   gui=bold guifg=gray guibg=white
highlight Type						cterm=NONE

" only for vim 5
if has("unix")
  if v:version<600
    highlight Normal  ctermfg=Grey	ctermbg=Black	cterm=NONE	guifg=Grey80      guibg=Black	gui=NONE
    highlight Search  ctermfg=Black	ctermbg=Red	cterm=bold	guifg=Black       guibg=Red	gui=bold
    highlight Visual  ctermfg=Black	ctermbg=yellow	cterm=bold	guifg=#404040			gui=bold
    highlight Special ctermfg=LightBlue			cterm=NONE	guifg=LightBlue			gui=NONE
    highlight Comment ctermfg=Cyan			cterm=NONE	guifg=LightBlue			gui=NONE
  endif
endif

