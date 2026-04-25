#!/bin/bash

timestamp=$(date +%s)
FILENAME="screenshot-$timestamp.png"
FILEPATH="$HOME/Pictures/temp_ss/$FILENAME"
SAVE_PATH="$HOME/Pictures/Screenshots/$FILENAME"

grim -g "$(slurp)" - | swappy -f - -o "$FILEPATH"

choice=$(printf "Copy to clipboard\nSave to disk\nCopy and Save\nCancel" | wofi --dmenu --prompt "What to do with screenshot?")

case "$choice" in
  "Copy to clipboard")
    wl-copy --type image/png < "$FILEPATH"
    rm "$FILEPATH"
    notify-send "Screenshot copied to clipboard"
    ;;
  "Save to disk")
    mv "$FILEPATH" "$SAVE_PATH"
    notify-send "Screenshot saved"
    ;;
  "Both")
    wl-copy --type image/png < "$FILEPATH"
    mv "$FILEPATH" "$SAVE_PATH"
    notify-send "Screenshot saved and copied"
    ;;
  *)
    rm "$FILEPATH"
    exit 0
    ;;
esac
