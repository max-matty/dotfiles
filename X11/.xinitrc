
xrdb -merge ~/.config/X11/.Xresources

urxvtd -o -q -f

setxkbmap -option 'caps:ctrl_modifier'

exec i3

