# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto
# xrandr --output HDMI-1-2 --primary --left-of eDP-1-1
# xrandr --dpi 96

## -- -- ##
xrandr --output HDMI2 --primary --left-of eDP1

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

exec i3
