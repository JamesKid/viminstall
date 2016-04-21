" Vim color file
" Maintainer:	Thorsten Maerz <info@netztorte.de>
" Last Change:	2006 Dec 07
" grey on black
" optimized for TFT panels
" fix history : fix by jameskid 2016.4.21 combile gui console 

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "torte"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" highlight Normal     ctermfg=LightGrey	ctermbg=Black
" highlight Normal     ctermfg=khaki	ctermbg=grey20
" 前景色背景色
hi Normal     guifg=Grey80	guibg=Black
hi Search     guifg=Black guibg=Red gui=bold ctermfg=Black	ctermbg=Black	cterm=NONE  
hi Visual	 guifg=#404040 gui=bold				cterm=reverse
"hi Cursor     ctermfg=Black	ctermbg=Green	cterm=bold
hi Cursor     guifg=Black guibg=Green gui=bold ctermfg=Black	ctermbg=Black	cterm=bold
hi Special    guifg=Orange ctermfg=Brown
hi Comment    guifg=#80a0ff ctermfg=Blue
" 状态栏 add by jameskid 2016.3.2
hi StatusLine guifg=blue guibg=white ctermfg=Black	ctermbg=White
hi Statement  guifg=Yellow gui=NONE ctermfg=Yellow	cterm=NONE
hi StatusLineNC	gui=NONE	guifg=black guibg=black	ctermfg=darkBlue  ctermbg=White
hi StatusLine	gui=bold	guifg=cyan	guibg=blue	ctermfg=Black   ctermbg=White
" 行数颜色
" hi LineNr		guifg=Black		ctermfg=blackGreen
" 分割线颜色 add by jameskid 2016.3.2
hi VertSplit	ctermfg=Black	ctermbg=Black guifg=Black guibg=darkGreen
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
hi DiffText   ctermbg=Red	   cterm=bold gui=bold guibg=#aa0000
hi FoldColumn ctermfg=DarkBlue	   ctermbg=Grey     guibg=Grey	    guifg=DarkBlue
hi Folded     ctermbg=Grey	   ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi IncSearch  cterm=reverse	   gui=reverse
hi ModeMsg    cterm=bold	   gui=bold
hi MoreMsg    ctermfg=DarkGreen    gui=bold guifg=SeaGreen
hi NonText    ctermfg=Blue	   gui=bold guifg=gray guibg=Black
hi Type gui=NONE	cterm=NONE

" only for vim 5
if has("unix")
  if v:version<600
    hi Normal  ctermfg=Grey	ctermbg=Black	cterm=NONE	guifg=Grey80      guibg=Black	gui=NONE
    hi Search  ctermfg=Black	ctermbg=Red	cterm=bold	guifg=Black       guibg=Red	gui=bold
    hi Visual  ctermfg=Black	ctermbg=yellow	cterm=bold	guifg=#404040			gui=bold
    hi Special ctermfg=LightBlue			cterm=NONE	guifg=LightBlue			gui=NONE
    hi Comment ctermfg=Cyan			cterm=NONE	guifg=LightBlue			gui=NONE
  endif
endif

