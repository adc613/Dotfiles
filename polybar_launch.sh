if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload --config=$HOME/.config/polybar/config.ini example &
  done
else
  polybar --reload --config=$HOME/.config/polybar/config.ini example &
fi
