let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
doautoall SessionLoadPre
silent only
silent tabonly
cd ~/programowanie/pico/ase
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess+=aoO
badd +52 src/main.c
badd +218 ~/programowanie/pico/ase/src/tcp.c
badd +14 ~/programowanie/pico/sdk/pico-examples/pico_w/wifi/blink/picow_blink.c
badd +30 ~/programowanie/pico/sdk/pico-examples/pico_w/wifi/blink/picow_blink_fast_clock.c
badd +191 ~/programowanie/pico/sdk/pico-examples/pico_w/wifi/tcp_client/picow_tcp_client.c
badd +213 ~/programowanie/pico/sdk/pico-sdk/lib/lwip/src/include/lwip/pbuf.h
badd +172 ~/.config/nvim/lua/plugins.lua
argglobal
%argdel
edit src/main.c
argglobal
balt ~/.config/nvim/lua/plugins.lua
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 52 - ((30 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 52
normal! 050|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
