# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --output HDMI-1-2 --primary --left-of eDP-1-1
# xrandr --output HDMI-2 --primary --left-of eDP-1
# xrandr --auto

xrandr --output eDP-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-3 --off --output HDMI-2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-2 --off --output DP-1 --off

# xrandr --output HDMI-1-3 --off --output HDMI-1-2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1-1 --off --output eDP-1-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1-2 --off --output DP-1-1 --off


[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
sudo chmod a+w /sys/class/backlight/intel_backlight/brightness

# Autostart section
redshift -l 39.979205:32.614248 &
udiskie &
feh --bg-fill --no-fehbg ~/.config/wall.jpg
dunst &
compton &
remaps
unclutter &



while true; do
    dwmstatus
    sleep 2s
done &

exec dwm
