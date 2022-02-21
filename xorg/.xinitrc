# Load .Xdefaults
[[ -f $HOME/.Xresources ]] && xrdb -merge ~/.Xresources

# Increase key repeat rate
xset r rate 200 25

# Set numlock on at login
setxkbmap -option caps:escape

# Set AltGr to Compose
setxkbmap -option compose:ralt
