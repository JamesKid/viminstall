set compatible
source $VIMRUNTIME/vimrc_example.vim
" if you are in the linux you need to remove the mswin.vim
"source $VIMRUNTIME/mswin.vim
behave mswin
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"===========================================JamesKid================================================
" Auther     : JamesKid
" Email		 : 1730874730@qq.com
" Blog       : 
" History    : " 2013_11_06_10_32
			   " 2013_12_05_17_24 add F5 to time, bash head
			   " 2013_12_09_18_49 add my own highlight
			   " 2013_12_18_16_01 add canphp tags ab "zrelate", "zlast", "zcontent", "zbread"
			   " 2013_12_21_11_03 add canphp tags ab "laurl", "lcurl", "ltitle", "lupdatetime"
			   " 2013_12_26_17_29 add open taglist in right side use ";l" shortcut 
			   " 2013_12_27_11_49 add "gk", "gj" treat long line as break lines 
			   " 2013_12_27_14_56 fix tab control as ";n", ";w", ";e", ";d"
			   " 2013_12_28_11_27 add auto matching "(", "{" and so on 
			   " 2013_12_28_15_01 add dictionary 
			   " 2013_12_30_11-00 add get time function imap it as ";v"
			   " 2013_12_30_14_53 add rainbow plugin ,map ctrl+w+h and  ctrl+w+l as ;s ;f
			   " 2014_01_07_11_27 add html "file auto control"
			   " 2014_01_07_16_46 add "SetComment"  function to set comment
			   " 2014_01_10_17_20 add tab map "1gt,2gt,2gt ..." to go to tab " 1,2,3..
			   " 2014_01_17_12_17 add font setting 
			   " 2014_01_17_15_45 add txtBroser plugin use tips
               " 2014_01_24_15_45 add map	 "html" one line to multy line's regular expression use ";c"
			   " 2014_02_19_10_16 add plugin easy motion setting 
			   " 2014_02_19_14_24 add ab	 <?php file ?> map as php
			   " 2014_03_04_14_24 add ab     jameskid head
			   " 2014_03_05_11_33 add plugin emmet
			   " 2014_03_07_11_33 add php test time and  test memory
			   " 2014_03_17_11_16 add lookupfile plugin note 
			   " 2014_05_22_16_51 add plugin "splitjoin"
			   " 2014_07_02_10_39 add map  "phputf8" as utf8 head
			   " 2014_10_16_17_56 add button "f7" go to the last file and station 
			   " 2014_11_10_11_06 add imap "shift + u" as "ctrl+u" "jj" as  "esc" 
			   " 2014_11_10_11_06 add add  select funciton as "vf"
			   " 2015_9_17_18_06 add add  easy motion use 
			   " 2015_9_24_18_06  change  easy motion key 
			   " 2015_9_24_20_06  add " code map" ka as '(' ks as ')' kd as [ kf as ]  
			   " 2015_9_24_21_06  add http://blog.jobbole.com/58978/   YouCompleteMe  autocomplete(自动补全插件)
			   " 2015_10_12_15_50  add plulgin "unite" use note and url
			   " 2015_10_13_11_50  add plulgin "easygrep" use note and url
			   
"====================================================================================================

" setting
		 " 对部分语言设置单独的缩进
		 au FileType groovy,scala,clojure,scheme,racket,lisp,lua,ruby,eruby,slim,elixir,julia,dart,coffee,jade,sh set shiftwidth=2
		 au FileType groovy,scala,clojure,scheme,racket,lisp,lua,ruby,eruby,slim,elixir,julia,dart,coffee,jade,sh set tabstop=2
		
		 " 根据后缀名指定文件类型
		 au BufRead,BufNewFile *.h        setlocal ft=c
		 au BufRead,BufNewFile *.m        setlocal ft=objc
		 au BufRead,BufNewFile *.di       setlocal ft=d
		 au BufRead,BufNewFile *.cl       setlocal ft=lisp
		 au BufRead,BufNewFile *.phpt     setlocal ft=php
		 au BufRead,BufNewFile *.inc      setlocal ft=php
		 au BufRead,BufNewFile *.sql      setlocal ft=mysql
		 au BufRead,BufNewFile *.tpl      setlocal ft=smarty
		 au BufRead,BufNewFile *.txt      setlocal ft=txt
		 au BufRead,BufNewFile hosts      setlocal ft=conf
		 au BufRead,BufNewFile http*.conf setlocal ft=apache
		 au BufRead,BufNewFile *.conf     setlocal ft=nginx
		 au BufRead,BufNewFile *.ini      setlocal ft=dosini
		 au BufRead,BufNewFile *.zj      setlocal ft=php

		" noremal setting
			set nu 
			set mouse=a
			set smartindent
			set tabstop=4
			set softtabstop=4
			set shiftwidth=4
			let &termencoding=$encoding
			set fileencoding=utf-8
			set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,gbk
			set fenc=utf-8
			set autoindent      " 自动缩进
			set smartindent      " 智能自动缩进
			" set helplang=cn    " let the help language to chinese
			"colorscheme desert
			colorscheme torte
			"set ignorecase 
			" No annoying sound on errors
				set noerrorbells
				set novisualbell
				set t_vb=
				set tm=500
			" not create tmp file 
				set nobackup
				set nowritebackup
				set noswapfile
		" status line
		"			"set statusline=%{strftime('%H:%M')}\\ \\%F%*\\%y\\%2*%r%m%*\\%l,%c\\%=%l/%L\\(%p%%)%*
	
		" press f7 go the the last file and station	
			set viminfo+=!  " Save and restore global variables.
			set sessionoptions=sesdir,help,tabpages,winsize,winpos,folds,resize
			let $VIMSESSION = '~/session.vim'
			autocmd VimLeave * mksession! $VIMSESSION
			autocmd VimLeave * let save_cursor = getpos(".")
			autocmd VimEnter  call setpos('.', save_cursor)
			nmap	<F7>	:so $VIMSESSION<cr

		"remove some bar 
			set guioptions-=m  "Remove menubar"
			set guioptions-=T  "Remove toolbar"
			set guioptions-=r  "Remove v_scroll bar" 
			set guioptions-=b  " remove under scroll bar 
		    set cursorline   " 高亮当前行
			set ruler  " 右下角显示光标位置的状态行
			
			"no auto huan_hang
			"set nowrap
		
		" read the file with utf-8
			set encoding=utf-8

		" set the menu & the message to Chinese
			" set langmenu=zh_CN.UTF-8
			" let $LANG= 'zh_CN.UTF-8'
			" source $VIMRUNTIME/delmenu.vim
			" source $VIMRUNTIME/menu.vim

		" set the menu & the message to English
			set langmenu=en_US.UTF-8
			language message en_US.UTF-8
			let $LANG= 'en_US'
			source $VIMRUNTIME/delmenu.vim
			source $VIMRUNTIME/menu.vim

		" full screen
			autocmd GUIEnter * simalt ~x

		" don't generate .swp file after edit file 
			set nobackup
		" php manual setting
			autocmd BufNewFile,Bufread *.ros,*.inc,*.php set keywordprg="help"	
	    	" set runtimepath +=E:\work_zhang\work\5_soft\4.vim\1.vim_plugin\13_php_manual\vim-php-manual
	    	 set runtimepath +=/root/zsj/vim/man/vim-php-manual
			
		" * highlight setting
		    " * example
				" match ErrorMsg /^Error/
			" * add my own highlight setting 
				au BufRead,BufNewFile *.zsj setlocal ft=zsj
				" au BufRead,BufNewFile *.zsj setfiletype html
		" remember last close when open 
		    "set sessionoptions=buffers,curdir,resize,folds,tabpages  
			"autocmd VimLeave * mks! "E:\work_zhang\work\5_soft\4.vim\7_my_vim_function\Session.vim"
			"function s:ReadSession()  
			"	let session_file = "E:\work_zhang\work\5_soft\4.vim\7_my_vim_function\Session.vim"
			"	if filereadable( session_file )  
			"		execute "so " . session_file  
			"	endif  
			"endfunction  
			"autocmd VimEnter * :call s:ReadSession()  

		" auto matching '(','{' and so on "
			":inoremap ( ()<ESC>i
			":inoremap ) <c-r>=ClosePair(')')<CR>
			":inoremap { {}<ESC>i
			":inoremap } <c-r>=ClosePair('}')<CR>
			":inoremap [ []<ESC>i
			":inoremap ] <c-r>=ClosePair(']')<CR>
			":inoremap < <><ESC>i
			":inoremap > <c-r>=ClosePair('>')<CR>
			":inoremap " ""<ESC>i
			":inoremap ' ''<ESC>i
			":inoremap ` ``<ESC>i
			"function ClosePair(char)
			"	if getline('.')[col('.') - 1] == a:char
			"		return "\<Right>"
			"	else
			"		return a:char
			"	endif
			"endf

		" remember the position of the cursor when exit the file
			autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif	

		" dictionary  
			 if has('win32')
				au FileType php setlocal dict+=E:\work_zhang\work\5_soft\4.vim\9_vim_dictionary\php.txt
				"au FileType css setlocal dict+=D:\css.txt
				"au FileType javascript setlocal dict+=D:\javascript.txt
			else
				"au FileType php setlocal dict+=~/.vim/dict/php_funclist.txt
				"au FileType css setlocal dict+=~/.vim/dict/css.txt
				"au FileType javascript setlocal dict+=~/.vim/dict/javascript.txt
			endif  
			set complete-=k complete+=k
		" font setting
			" show what font you have and you can choice one font
				" :set guifont=* 
			" echo what font you now use
				" :echo &guifont
		" color setting
			 "set background=dark
  
" map
		" map tips:	
			"you can use char 'v' and char '\' to add map ,because it have a
			"lot of empty two char  

		" path map 
			" windows
				"map ve :e D:\wamp\bin\apache\Apache2.4.4\conf\extra\httpd-vhosts.conf <cr>
				"map vc :e C:\Program Files\Vim\_vimrc <cr> 
				"map vm :e C:\Windows\System32\Drivers\etc\hosts <cr>
				"map vn :e E:\work_zhang\work\5_soft\4.vim\4.vim_setting.txt <cr>
				"map vz :e E:\work_zhang\work\3_journal\1_journal_day.txt <cr>
				"map vr :e E:\work_zhang\work\3_journal\2_english_good_sentence.txt <cr>
				"map vg :e E:\work_zhang\work\5_soft\19_auto_hot_key\ahk_zsj.ahk <cr>
				"map vx :e E:\work_zhang\work\12_web_frame\duxcms1.1.0稳定版\2_tags\canphp标签调用.txt <cr>
			" linux
				 map vm :e /etc/hosts <cr>
				 map vc :e /usr/local/share/vim/vimrc <cr>
				 map ve :e ~/.emacs <cr>

		" code map (符号map)
			imap ka (
			imap ks )
			imap kd [
			imap kf ]
			imap kr $
			imap ke =
			imap jd {
			imap jf }
		" command map 
			noremap <S-u> <C-u>
			noremap <S-d> <C-d>
			imap <C-l> <Esc>
			imap kv <Esc>
			map vd :bd% <cr>
			map vo :bp <cr> <cr>
			map vp :bn <cr>
			map vq :wq! <cr>
			map vs :w <cr>
			map vh :help <cr>
			"map <space> <PageDown>
			map ;a <CTRL-w>
			map vy :g/^\s*$/d<cr>
			map ;k :%s/^\s\+//g <cr>
			" leader
			let mapleader=","
			let g:mapleader=","
			" add F6 to print time  add 2013.12.5
            nnoremap <F6> "=strftime("%F")<CR>gP
            inoremap <F6> <C-R>=strftime("%F")<CR>
			map ;s <c-w>h 
			map ;f <c-w>l
			map ;c <c-w>j
			map ;x <c-w>k
			" 全选
				map vi ggvG$y
				map ,a ci"
				map ,s ci'
			"tab map
				map ;n :tabnew <cr>
				map ;d :tabclose <cr>
				map ;w :tabp <cr>
				map ;e :tabn <cr>
				nmap <M-1> 1gt  
				nmap <M-2> 2gt
				nmap <M-3> 3gt
				nmap <M-4> 4gt
				nmap <M-5> 5gt
				nmap <M-6> 6gt
				nmap <M-7> 7gt
			" unmap 
			" select map 
				" select funciton as vf 
				 nmap vf V$%y


			" treat long line as break lines 
				"map j gj
				"map k gk 
				
		"  insert mode diresction
			noremap! <M-j> <Down>
			noremap! <M-k> <Up>
			noremap! <M-h> <left>
			noremap! <M-l> <Right>

        " macro map  
			" canphp
				ab  chead 	
							\<title>{$common.title}</title> <cr>
							\<meta name="keywords" content="{$common.keywords}" /> <cr>
							\<meta name="description" content="{$common.description}" />
				ab  ihead 
							\<title>{$sys.seoname}_{$sys.sitename}</title> <cr>
							\<meta name="keywords" content="{$sys.keywords}" /> <cr>
							\<meta name="description" content="{$sys.description}" />
				ab  zfoot 
							\<!--#include file="foot.html"-->
				ab  zhead  
							\<!--#include file="head.html"-->
				ab  zleft 
							\<!--#include file="left.html"-->
				ab  znav 
							\<!--list:{table="category" type="top" order="cid asc" limit="7"}--> <cr>
							\	<a href="{$list.curl}" target="_self" class=menumain_dolphin> <cr>
							\		<span>{$list.name}</span> <cr>
							\	</a>  <cr>
							\<!--/list--> 
			    ab  zroll 
							\<!--list:{table="category" pid="2" order="cid asc" limit="5"}--> <cr>
							\	<!--product:{table="content"  cid="<$list.cid>" order="updatetime desc" limit="12"}--> <cr>
							\			<div class=box> <cr>
							\				<div style="WIDTH: 120px; HEIGHT: 120px" class=fang> <cr>
							\					<div style="WIDTH: 120px; HEIGHT: 120px" class=picFit> <cr>
							\						<A href="{$product.aurl}" target=_self> <cr>
							\							<IMG border=0 src="{$product.image}" width=120 height=120> <cr>
							\						</A>  <cr>
							\					</div> <cr>
							\				</div> <cr>
							\				<A class=prodtitle href="{$product.aurl}" target=_self>{$product.title}</A> <cr>
							\			</div> <cr>
							\	<!--/product--> <cr>
							\<!--/list--> 
				ab  zcompanypicture 
							\<!--sublist:{table="category" cid="1" order="cid asc" limit="5"}--> <cr>
							\	 <a href="{$sublist.curl}"> <cr>
							\		<img width="256px" height="300px" src="{$sublist.image}"> <cr>
							\	 </a> <cr>
							\<!--/sublist-->
				ab  zleftproduct 
							\<!--list:{table="category" pid="2" order="cid desc" limit="5"}--> <cr>
							\	<a class=productclass_dolphin href="{$list.curl}" target=_self>{$list.name}</a> <cr>
							\<!--/list-->
				ab  znewslist 
							\<!--content:{table="content" cid="4" order="updatetime desc" limit="7"}--> <cr>
							\	<li class=newslist_1><A class=newslist_1  <cr>
							\		href="{$content.aurl}" <cr> 
							\		target="">{$content.title}</A></li> <cr>
							\<!--/list-->
				ab  zproductlist 
							\<!--foreach:{$loop $vo}--> <cr>
							\  <li><h3><a href="{$vo.aurl}" title="{$vo.titlex}">{$vo.titlex}</a></h3><span>{$vo.updateime time="Y-m-d"}</span></li> <cr>
							\<!--/loop-->
				ab  zservice  
							\<!--service:{table="content"  cid="11" order="updatetime desc" limit="12"}--> <cr>
							\<li><img src="{$service.image}" width="108" height="144" alt="yewu"/></li>
							\<!--/service--> <cr>
				ab zcompanyprofile 
							\<!--list:{table="category_page" cid="1"  limit="1"}--> <cr>
							\{$list.content html}[<a  href="{$list.curl}">详细</a>] <cr>
							\<!--/list-->
				ab webinfo 
							\网站地址：<cr>
							\网站后台地址：<cr>
							\网站后台用户名：<cr>
							\网站后台密码:
				ab imagelist 
							\<!--list:{table="content" image="true" order="updatetime desc" limit="4"}-->
				ab newslist 
							\<!--list:{table="content" order="updatetime desc" limit="10"}-->
			    ab randlist 
							\<!--list:{table="content" rand="true" limit="9"}-->
				ab zposition 
							\当前位置： <a href="__APP__/">首页</a><!--foreach:{$nav $list}--> ›› <a href="{$list.curl}" >{$list.name}</a><!--/list-->
				ab leftlist 
							\<!--list:{table="category" pid="<$top_category.cid>" order="cid desc" limit="5"}-->
			    ab zrelate  
							\<!--list:{table="content" rand="true" related="<$info.aid>" limit="10"}-->
					        \<li> <span class="line">•</span> <span class="title"><a href="{$list.aurl}" title="{$list.title}">{$list.title len="25"}</a> </span></li>
				            \<!--/list--> 
				ab zlast  
							\<div class="updown">
							\<div class="previous">
							\上一篇：
							\<!--if:{empty($prev)}--> 
							\暂无 
							\<!--{else}--> 
							\<a href="{$prev.aurl}">{$prev.title}</a> 
							\<!--/if--> 
							\</div>
							\<div class="next">
							\下一篇
							\<!--if:{empty($next)}--> 
							\暂无 
							\<!--{else}--> 
							\<a href="{$next.aurl}">{$next.title}</a> 
							\<!--/if--> 
							\</div>
							\</div>
				ab zcontent 
							\作者：{$info.copyfrom}
							\浏览量：{$info.views}
							\发布时间：{$info.updatetime time="Y-m-d h:i:s"}
							\关键字：{$info.keywords tag}
							\内容：{$info.content}
				ab zbread 
							\当前位置： <a href="__APP__/">首页</a><!--foreach:{$nav $list}--> ›› <a href="{$list.curl}" >{$list.name}</a><!--/list--> 
				ab lcurl 
							\{$list.curl}
				ab laurl 
							\{$list.aurl}
				ab ltitle 
							\{$list.title}
				ab lupdatetime 
							\{$list.updatetime time="Y-m-d"}
				ab ztab 
							\<!--list:{table="category" att="list" order="cid asc" limit="2"}--> <cr>
							\<!--content:{table="content" cid="<$list.cid>" order="updatetime desc" limit="6"}-->	<cr>
							\<!--/content--> <cr>
							\<!--/list-->

				"mysql
					ab myh  
							\/*!40101 SET @saved_cs_client     = @@character_set_client */; <cr>
							\/*!40101 SET character_set_client = utf8 */;
					ab mye 
							\/*!40101 SET character_set_client = @saved_cs_client */;

				" bash head 
                    ab bh 
                        \#!/bin/bash <cr>
                        \# Description:  this program is  <cr>
                        \# Editor:       zhangshijie <cr> 
                        \# Email:        406358964@qq.com <cr>
                        \# Version:      1.0 <cr>
                        \# History:      <F6> creat
						\# Date:   　　　call append(line(".")+3,"*    Date        : ".strftime("%Y.%m.%d"))

				" JamesKid head
					ab jameskidh 
						\" ================================JamesKid============================== <cr>
						\" @author		: JamesKid  <cr>
						\" @description :<cr>
						\" @change		:<cr>
						\" ======================================================================
				" html5head
				"
				ab  html5h 
						\<!DOCTYPE html> <cr>
						\<html><cr>
						\<head><cr>
						\<meta http-equiv="Content-Type" content="text/html; charset=uft-8"><cr>
						\<title></title><cr>
						\<meta name="Keywords" content=""><cr>
						\<meta NAME="description" CONTENT=""><cr>
						\<link href="xx.css" rel="stylesheet" type="text/css"><cr>
						\<script language="JavaScript" src="xx.js"></script><cr>
						\<body><cr>
						\</body><cr>
						\</html><cr>
				" php 
					" php utf-8 head
						ab phputf8 header("Content-Type: text/html; charset=utf-8");
					" php file head
						:inoremap phh <?php?><ESC>hi<cr><cr><ESC>ki
					" php test
						:inoremap ptest  echo<space>"ok";die;
						" time test
							ab btime $beginTime=microtime(true);
							ab etime $endTime=microtime(true);<cr>$useTime=$endTime-$beginTime;<cr>echo $useTime;
						" memory test
							ab bmemory $beginMemory = memory_get_usage();
							ab ememory echo "<br />";<cr>$endMemory = memory_get_usage();<cr>$useMemory = $endMemory - $beginMemory;<cr>echo $useMemory;
					" php print die
						    ab yip  print_r($result);die;
						    ab yipd print_r($data);die;
			
" other
		" weiBo  
			let g:weibo_access_token='C1DC586CEA8332614E8C2687730FD55B'
	
" source 
		" source function
			"source E:\work_zhang\work\5_soft\4.vim\7_my_vim_function\1_common.vim	" my first function
		" function here
				" zip all line to one line 
					imap ;m <c-r>=line('$')<S-J>
				" get time
					"imap ;v <c-r>=strftime('%c')<cr>
					imap ;v <c-r>=strftime('%Y-%m-%d')<cr>
				" add my comment function
					autocmd BufNewFile *.zsj,*.jam exec ":call SetComment()"
					func SetComment()
						call setline(1,"/*===============================================================")
						call append(line("."),"*  ") 
						call append(line(".")+1,"*    File Name   : ".expand("%:t")) 
						call append(line(".")+2,"*    Author      : JamesKid")
						call append(line(".")+3,"*    Date        : ".strftime("%Y.%m.%d")) 
						call append(line(".")+4,"*    Description : ") 
						call append(line(".")+5,"*    Update Log  : ") 
						call append(line(".")+6,"*    Tencent.co") 
						call append(line(".")+7,"================================================================*/") 
					endfunc
				" use ctrl+ + and ctrl+ - to contrl font-size
					nnoremap <C-kplus>	:call IncFontSize(+1)<CR>
					nnoremap <C-kMinus>	:call IncFontSize(-1)<CR>
					nnoremap <C-k0>	    :call IncFontSize(0)<CR>
					fun! IncFontSize(inc)
						if !exists('+guifont')
							return
						endif
						let s:defaultfont =' Ubuntu Mono 12'
						if a:inc==0 || empty(&guifont)
							let &guifont = s:defaultfont
							return
						endif			
						lef &guifont = substitute (&guifont, '\d\+$', '\=submatch(0)+'.a:inc, '')
					endfun
					" function2　
						let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
						let s:minfontsize = 6
						let s:maxfontsize = 16

						function! AdjustFontSize(amount)
							if has("gui_gtk2") && has("gui_running")
								let fontname = substitute(&guifont, s:pattern, '\1', '')
								let cursize = substitute(&guifont, s:pattern, '\2', '')
								if (cursize < s:minfontsize) || (cursize > s:maxfontsize)
									let cursize = 10
								endif
								let newsize = cursize + a:amount
								if (a:amount > 1) 
									let newsize = a:amount
								endif
								if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
									let newfont = fontname . " " . newsize
									let &guifont = newfont
								endif
							else
								echoerr "You need to run the GTK2 version of Vim to use this function."
							endif
						endfunction 

						map <C-Up> :call AdjustFontSize(1) <CR>
						map <C-Down> :call AdjustFontSize(-1) <CR>
						map <C-Home> :call AdjustFontSize(10) <CR> 

" plugin_setting

		" winManager	
 
				"设置界面分割
				"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
				"let g:winManagerWindowLayout = "FileExplorer|TagList,BufExplorer"
				"let g:winManagerWindowLayout = 'NERDTree|TagList,BufExplorer'
				"let g:winManagerWindowLayout="TagList,BufExplorer"
				let g:winManagerWindowLayout = 'NERDTree,BufExplorer'
		
				"设置winmanager的宽度，默认为25
				let g:winManagerWidth = 25
				"定义打开关闭winmanager按键 这里定义为F11
				" shortcut to open Nerdtree and taglist
				nmap <silent> ;j :WMToggle<cr>
				nmap <silent> ;l :TlistToggle<cr>
				"在进入vim时自动打开winmanager

				let g:AutoOpenWinManager = 1

		" ctags 	
				"生成一个tags文件
				nmap <f9> <esc>:!ctags -R *<cr>

		" taglist	
				" 这项必须设定，否则出错,配置taglist的ctags路径
				"let Tlist_Ctags_Cmd = 'D:\ctags58\ctags.exe'
				" you can use 'yum install ctags' to install it in linux
				let Tlist_Ctags_Cmd = '/usr/bin/ctags'

				" 不同时显示多个文件的 tag ，只显示当前文件的
				let Tlist_Show_One_File=1

				" 如果 taglist 窗口是最后一个窗口，则退出 vim
				let Tlist_Exit_OnlyWindow=1

				"让当前不被编辑的文件的方法列表自动折叠起来
				let tlist_file_fold_auto_close=1

				"把taglist窗口放在屏幕的右侧，缺省在左侧
				let Tlist_Use_Right_Window=1

				"显示taglist菜单
				let tlist_show_menu=1

				"启动vim自动打开taglist
				"let Tlist_Auto_Open=1
		" cscope
				"cs a E:\work_zhang\work\14_work\web\2_company_zhong\2_dynamic_web\canphp\cscope.out

		" txtBrowser
				" config
					syntax on
					filetype plugin on
					au BufEnter *.txt setlocal ft=txt
					let TxtBrowser_Dict_Url='http://dict.cn/text'
				" use note 
					" \g      : go the the website under the cursur
					" \f	  : find the meaning of the word in the dictionary
					" \s	  : search the word under the cursor
					" \h	  : heightlight the word under the cursor

		" NERDTree
				"let NERDTRee_Auto_Open=1
				 let NERDChristmasTree=1   " let the nerdtree colorfull 
		
		" miniBufExpl
				"let g:miniBufExplMapWindowNavVim = 1
				"let g:miniBufExplMapWindowNavArrows = 1
				"let g:miniBufExplMapCTabSwitchBufs = 1
				"let g:miniBufExplMSelTarget = 1
				"let g:miniBufExplMoreThanOne = 0

		" bufexplorer
		" rainbrow 
			"let g:rainbow_active = 1
			"let g:rainbow_operators = 2
		" easy motion
			" use tips 
				" \\w    :find word after
				" \\W    :find word before
				" \\e    :find word end after
				" \\E    :find word end before 
				" \\f	 :find letter after
				" \\F	 :find letter before
				nmap  fw <leader><leader>w
				nmap  fW <leader><leader>W
				nmap  fe <leader><leader>e
				nmap  fE <leader><leader>E
				nmap  a <leader><leader>f
				nmap  e <leader><leader>F
		" emmet
			" git path 
				" git clone https://github.com/mattn/emmet-vim.git
			" use tips 
				" input 'div>ul>li*5' then press ctrl+y then press ,
			" config
				" change key 
					" let g:user_emmet_leader_key='<c-p>'
				" enable in different mode
					" let g:user_emmet_mode='n'    " only enable normal mode
					" let g:user_emmet_mode='inv'  " enable all mode
					" let g:user_emmet_mode='a'    " enable all mod
				" enable just for html/css
					" let g:user_emmet_install_global = 0
					" autocmd FileType html,css EmmetInstall
			" help
				" https://raw.github.com/mattn/emmet-vim/master/TUTORIAL

		" look up file
			
			let g:LookupFile_TagExpr = '"./filenametags"' 	" 设定filenametags
			let g:LookupFile_TagExpr ='"/usr/local/share/vim/filenametags113"' " tags的路径,可自定
			let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
			let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
			let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
			let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
			let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
			if filereadable("/usr/local/share/vim/filenametags113")                "设置tag文件的名字
				let g:LookupFile_TagExpr = '"/usr/local/share/vim/filenametags113"'
			endif
			"映射LookupFile为,lk
			nmap <silent> <leader>lk :LUTags<cr>
			""映射LUBufs为,ll
			nmap <silent> <leader>ll :LUBufs<cr>
			"映射LUWalk为,lw
			nmap <silent> <leader>lw :LUWalk<cr>
			" help 
				" http://easwy.com/blog/archives/advanced-vim-skills-lookupfile-plugin/
			" create filenametags
				"create filenametags file and put this file to /vim74/ and run it 

				"#!/bin/sh
				"# generate tag file for lookupfile plugin
				"echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
				"find . -not -regex '.*\.\(png\|gif\)' -type f -printf "%f\t%p\t1\n" | \
				"sort -f >> filenametags 
			" use 
				" ctrl+n  : go to the next select 
				" ctrl+p  : go to the pre select 
				" enter   : go to file 
				"

		" splitjoin 
			" use tips 
				map gS : split line 
				" gJ   :  join line 
		" airline设置
			 set laststatus=2
			" " 使用powerline打过补丁的字体
			 let g:airline_powerline_fonts = 1
			" " 开启tabline
			 let g:airline#extensions#tabline#enabled = 1
			" " tabline中当前buffer两端的分隔字符
			 let g:airline#extensions#tabline#left_sep = ' '
			" " tabline中未激活buffer两端的分隔字符
			 let g:airline#extensions#tabline#left_alt_sep = '|'
			" " tabline中buffer显示编号
			 let g:airline#extensions#tabline#buffer_nr_show = 1
			" " 映射切换buffer的键位
			 nnoremap [b :bp<CR>
			 nnoremap ]b :bn<CR>
		" unite 
			" plugin url 
				" https://github.com/Shougo/unite.vim
			" use
				" :Unite file_rec  <CR>   " 查找当前目录所有文件
				" :Unite bookmark  <CR>   " 打开书签目录
				
			" map 
				" 查找上一级目录后的文件
					nmap fz :Unite file <CR>
				" 查找当前目录文件
					nmap ff :Unite file_rec <CR>
				" 查找文件内容
					nmap fv :Unite vimgrep <CR>
		" easygrep 
			" plugin url 
				" https://github.com/dkprice/vim-easygrep
			" use
				" set replace in local pane(在当前窗口全部替换)
					" press ?   " show all the menu
					" press m   " replace window mode to (autowriteall)
				
			" map 
				" default
					" <Leader>vv  - Grep for the word under the cursor, match all occurences, li= |gstar|
					" <Leader>vV  - Grep for the word under the cursor, match whole word, li= |star|
					" <Leader>va  - Li= vv, but add to existing list
					" <Leader>vA  - Li= vV, but add to existing list
					" <Leader>vr  - Perform a global search search on the word under the cursor and prompt for a pattern with which to replace it.
					" <Leader>vo  - Select the files to search in and set grep options
					" <Leader>vy* - Invo= any option from the options explorer, where * is the shortcut for that option.  e.g. <Leader>vyr - toggles recursion
					" <Leader>vyb - sets buffer grepping mode etc.



" file auto control 
		" html
			" autocmd Bufread *.html 	 normal! gg=G  <cr>
		" php
