#!/bin/bash

# Check if zsh is installed
if ! command -v zsh &> /dev/null; then
  echo "zsh is not installed. Please install zsh first."
  exit 0
fi

# Check if Oh My Zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh not found. Installing..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

