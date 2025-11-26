#!/bin/bash

### ssh
ln -s "$PWD/.ssh" "$HOME/"

### .gitconfig
ln -s "$PWD/gitconfig/.gitconfig" "$HOME/"

### .gitconfig-personal
ln -s "$PWD/gitconfig/.gitconfig-personal" "$HOME/personal-repos/"

### .gitconfig-work
ln -s "$PWD/gitconfig/.gitconfig-work" "$HOME/work-repos/"

### .gitignore
ln -s "$PWD/.gitignore" "$HOME/"

### .hushlogin
ln -s "$PWD/.hushlogin" "$HOME/"

### Brewfile
ln -s "$PWD/Brewfile" "$HOME/"

### fish.config
if [ -e "$HOME/.config/fish/config.fish" ]; then
  rm "$HOME/.config/fish/config.fish"
fi

ln -s "$PWD/config.fish" "$HOME/.config/fish/config.fish"

### fish functions
ln -sf "$PWD/fish/functions/jset.fish" "$HOME/.config/fish/functions/jset.fish"
ln -sf "$PWD/fish/functions/jver.fish" "$HOME/.config/fish/functions/jver.fish"

### fish completions
ln -sf "$PWD/fish/completions/jset.fish" "$HOME/.config/fish/completions/jset.fish"