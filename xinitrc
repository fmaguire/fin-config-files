xrdb ~/.Xresources
setxkbmap -layout gb
setxkbmap -option caps:escape
xmodmap -e "keycode 47 = colon semicolon" 
xset -b
exec i3
