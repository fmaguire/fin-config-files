xrdb ~/.Xresources
setxkbmap -layout gb
setxkbmap -option caps:escape
xmodmap -e "keycode 47 = colon semicolon" 
xset -b
exec i3 -V >> ~/.i3/log/$(date +'%F-%k-%M-%S').log 2>&1
