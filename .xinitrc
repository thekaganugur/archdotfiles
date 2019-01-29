xrandr --output HDMI-2 --primary --left-of eDP-1
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
sudo chmod a+w /sys/class/backlight/intel_backlight/brightness

# Autostart section
redshift -l 39.979205:32.614248 &
udiskie &
feh --bg-fill ~/.config/wall.jpg
dunst &
compton &
remaps
unclutter &



while true; do
    dwmstatus
    sleep 2s
done &

exec dwm
# exec i3
#exec qtile
