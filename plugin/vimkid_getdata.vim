"================================ VimKid ======================================
"title :       My first plugin
"Description : My first plugin,about get info from website
"Author:       Vimkid
"========================== www.vimkid.com ====================================


" 获取vim使用提示
function vimkid_getdata#getTips() 
    let str = system("curl -s \"http://vim-tips.com/random_tips/txt\"")
    echo "vimkid: ".str
endfunction

" 获取外网ip
function vimkid_getdata#getIp() 
    let str = system("curl -s 'www.vimkid.com/jiekou/getip'")
    echo "vimkid: outIp is " .str
endfunction

" 获取手机信息
function vimkid_getdata#getPhoneInfo() 
    "let str = system("curl -s 'https://tcc.taobao.com/cc/json/mobile_tel_segment.htm?tel=13481407788'")
    let str = system("curl -s 'http://www.apifree.net/mobile/18523004409.xml'")
    echo "vimkid: outIp is ".str
endfunction

" 获取天气

" 获取服务器当前用户

" 获取vpn当前用户

command! VimkidGetTips call vimkid_getdata#getTips()
command! VimkidGetIp call vimkid_getdata#getIp()
command! VimkidGetPhoneInfo call vimkid_getdata#getPhoneInfo()
nmap lo :VimkidGetTips<cr>
nmap l, :VimkidGetIp<cr>

