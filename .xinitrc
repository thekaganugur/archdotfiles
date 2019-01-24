#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
#xrandr --output HDMI-1-2 --primary --left-of eDP-1-1
# xrandr --dpi 96

## -- -- ##
xrandr --output HDMI-2 --primary --left-of eDP-1

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

sudo chmod a+w /sys/class/backlight/intel_backlight/brightness

exec i3
#exec qtile
