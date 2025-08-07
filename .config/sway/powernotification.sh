#!/bin/bash

notified=0

while true; do
  battery=$(cat /sys/class/power_supply/BAT0/capacity)
  status=$(cat /sys/class/power_supply/BAT0/status)

  if [ "$battery" -le 15 ] && [ "$status" == "Discharging" ]; then
    if [ "$notified" -eq 0 ]; then
      notify-send -u critical "⚠️ Low Battery" "Battery is at ${battery}%"
      notified=1
    fi
  elif [ "$battery" -gt 16 ]; then
    notified=0
  fi

  sleep 60
done
