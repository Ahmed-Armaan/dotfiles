#!/bin/bash

chosen=$(printf "Sleep\nShutdown\nReboot\nCancel" | \
    wofi --dmenu --prompt "Power" --lines 6)

case "$chosen" in
  "Sleep") /usr/local/bin/sleep.sh ;;
  "Shutdown") systemctl poweroff ;;
  "Reboot") systemctl reboot ;;
  *) exit 0 ;;
esac
