
# keyboard repeat rate
xset r rate 200 50 &
# speed up the mouse to 2x, 0 threshold before acceleration
xset m 2 0

# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps &

# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape' &
