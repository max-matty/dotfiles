
xrdb -merge ~/.config/X11/.Xresources

urxvtd -o -q -f

setxkbmap -option 'caps:ctrl_modifier'

if [[ "$(xrandr | grep Virtual-1)" != "" ]]; then
   xrandr --output Virtual-1 --mode 1920x1080 --pos 0x0 --rotate normal
fi

exec i3

