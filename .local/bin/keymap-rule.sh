sleep 1
DISPLAY=":0.0"
HOME=/home/pazu/
XAUTHORITY=$HOME/.Xauthority
export DISPLAY XAUTHORITY HOME
daskb_id=`xinput -list | grep -i 'daskeyboard' | grep -o id=[0-9]. | grep -o [0-9]. | head -1`
setxkbmap -option caps:escape &
xset r rate 280 40


