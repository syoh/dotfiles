#!/bin/bash

# Check if zsh is installed
if ! command -v zsh &> /dev/null; then
  echo "zsh is not installed."
  if sudo -v &> /dev/null; then
    echo "Installing zsh..."
    sudo apt-get update && sudo apt-get install -y zsh
  else
    echo "Please install zsh manually."
    exit 0
  fi
fi

# Check if Oh My Zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh not found. Installing..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

