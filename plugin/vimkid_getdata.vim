"================================ VimKid ======================================
"title :       My first plugin
"Description : My first plugin,about get info from website
"Author:       Vimkid
"========================== www.vimkid.com ====================================


" 获取vim使用提示
function vimkid_getdata#getTips() 
    let str = system("curl -s \"http://vim-tips.com/random_tips/txt\"")
    echo "vimkid: "
    echo "中文"
    echo str
    " return split(str,"\n")[0]
endfunction

" 获取外网ip
function vimkid_getdata#getIp() 
    let str = system("curl -s 'www.vimkid.com/jiekou/getip'")
    echo "vimkid: outIp is "
    echo str
    " return split(str,"\n")[0]
endfunction

" 获取天气

" 获取服务器当前用户

" 获取vpn当前用户

command! VimkidGetTips call vimkid_getdata#getTips()
command! VimkidGetIp call vimkid_getdata#getIp()
nmap lo :VimkidGetTips<cr>
nmap l, :VimkidGetIp<cr>

