let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 .dotfiles
badd +21 .dotfiles/packages/waybar/waybar-sway.nix
badd +10 .dotfiles/packages/waybar/waybar-vm.css
badd +36 .dotfiles/packages/waybar/waybar-hyprland.nix
badd +13 .dotfiles/packages/foot/foot.nix
badd +2 .dotfiles/packages/alacritty/alacritty.nix
badd +4 .dotfiles/hosts/virtual-box/configuration.nix
badd +27 .dotfiles/utils/colors.nix
argglobal
%argdel
$argadd .dotfiles
edit .dotfiles/packages/foot/foot.nix
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 118 + 118) / 237)
exe '2resize ' . ((&lines * 28 + 30) / 60)
exe 'vert 2resize ' . ((&columns * 118 + 118) / 237)
exe '3resize ' . ((&lines * 29 + 30) / 60)
exe 'vert 3resize ' . ((&columns * 118 + 118) / 237)
argglobal
balt .dotfiles/hosts/virtual-box/configuration.nix
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=3
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 13 - ((12 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 13
normal! 08|
lcd ~/.dotfiles/packages/waybar
wincmd w
argglobal
if bufexists(fnamemodify("~/.dotfiles/utils/colors.nix", ":p")) | buffer ~/.dotfiles/utils/colors.nix | else | edit ~/.dotfiles/utils/colors.nix | endif
if &buftype ==# 'terminal'
  silent file ~/.dotfiles/utils/colors.nix
endif
balt ~/.dotfiles/packages/alacritty/alacritty.nix
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=3
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 68 - ((10 * winheight(0) + 14) / 28)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 68
normal! 0
lcd ~/.dotfiles/packages/waybar
wincmd w
argglobal
if bufexists(fnamemodify("~/.dotfiles/packages/alacritty/alacritty.nix", ":p")) | buffer ~/.dotfiles/packages/alacritty/alacritty.nix | else | edit ~/.dotfiles/packages/alacritty/alacritty.nix | endif
if &buftype ==# 'terminal'
  silent file ~/.dotfiles/packages/alacritty/alacritty.nix
endif
balt ~/.dotfiles/utils/colors.nix
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=3
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 27 - ((18 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 27
normal! 033|
lcd ~/.dotfiles/packages/waybar
wincmd w
exe 'vert 1resize ' . ((&columns * 118 + 118) / 237)
exe '2resize ' . ((&lines * 28 + 30) / 60)
exe 'vert 2resize ' . ((&columns * 118 + 118) / 237)
exe '3resize ' . ((&lines * 29 + 30) / 60)
exe 'vert 3resize ' . ((&columns * 118 + 118) / 237)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
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
