"==============================================================================
"title : my first plugin
"Author: jameskid
"==============================================================================


if exists('s:loaded') || !(exists('g:rainbow_active') || exists('g:rainbow_conf'))
	finish
endif
let s:loaded = 1

"func rainbow#load()
"endfunc

"func rainbow#clear()
"	call rainbow#hide()
"	if exists('b:rainbow_loaded')
"		for each in range(b:rainbow_loaded)
"			exe 'syn clear rainbow_r'.each
"			exe 'syn clear rainbow_o'.each
"		endfor
"		unlet b:rainbow_loaded
"	endif
"endfunc

"func rainbow#show()
"	if exists('b:rainbow_loaded')
"		let b:rainbow_visible = 1
"		for id in range(b:rainbow_loaded)
"			let ctermfg = b:rainbow_conf.ctermfgs[id % len(b:rainbow_conf.ctermfgs)]
"			let guifg = b:rainbow_conf.guifgs[id % len(b:rainbow_conf.guifgs)]
"			exe 'hi rainbow_p'.id.' ctermfg='.ctermfg.' guifg='.guifg
"			exe 'hi rainbow_o'.id.' ctermfg='.ctermfg.' guifg='.guifg
"		endfor
"	endif
"endfunc

func rainbow#toggle()
	echohl hostname()
	"if exists('b:rainbow_loaded')
	"	call rainbow#clear()
	"else
	"	if exists('b:rainbow_conf')
	"		call rainbow#load()
	"	else
	"		call rainbow#hook()
	"	endif
	"endif
endfunc

command! MyFun call rainbow#toggle()
"command! RainbowToggleOn call rainbow#load()
""command! RainbowToggleOff call rainbow#clear()
