#!/bin/bash

# List of actual config files to track
CONFIG_FILES=(
  "$HOME/.bashrc"
  "$HOME/.config/sway/"
  "$HOME/.config/waybar/"
  "$HOME/.config/kitty/"
  "$HOME/.config/wofi/"
)

# Path to your dotfiles repo
DOTFILES_DIR="$HOME/dotfiles"

# Temporary copy files to dotfiles directory
for FILE in "${CONFIG_FILES[@]}"; do
  # Compute relative path inside dotfiles repo
  REL_PATH=$(realpath --relative-to="$HOME" "$FILE")
  DEST="$DOTFILES_DIR/$REL_PATH"
  mkdir -p "$(dirname "$DEST")"
  cp -r "$FILE" "$DEST"
done

# Move into dotfiles repo
cd "$DOTFILES_DIR" || exit 1

# Check for changes
if [[ -n $(git status --porcelain) ]]; then
  git add .
  git commit -m "Update dotfiles on $(date '+%Y-%m-%d %H:%M:%S')"
  git push
else
  echo "✅ No changes to commit."
fi

# Clean up copied files
for FILE in "${CONFIG_FILES[@]}"; do
  REL_PATH=$(realpath --relative-to="$HOME" "$FILE")
  rm -f "$DOTFILES_DIR/$REL_PATH"
done
