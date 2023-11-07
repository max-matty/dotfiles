
xrdb -merge ~/.config/X11/.Xresources

urxvtd -o -q -f

setxkbmap -option 'caps:ctrl_modifier'

if [ "$(cat ~/.screenplay/var_inst" = "VM" ]; then
  xrandr --newmode "1600x900_60.00"  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync
  xrandr --addmode Virtual-1 1600x900_60.00
  xrandr --newmode "1368x768_60.00"   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync
  xrandr --addmode Virtual-1 1368x768_60.00
  xrandr --output Virtual-1 --mode 800x600
fi

exec i3

