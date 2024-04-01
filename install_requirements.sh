#!/bin/bash

is_installed() {
    brew list "$1" &>/dev/null
}

if ! is_installed "ripgrep"; then
    echo "Installing ripgrep..."
    brew install ripgrep
else
    echo "ripgrep is already installed, skipping..."
fi

if ! is_installed "fzf"; then
    echo "Installing fzf..."
    brew install fzf
else
    echo "fzf is already installed, skipping..."
fi

echo "Cloning Packer..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim || echo "The packer folder already exists! The clone step will be skipped."


echo "Installation complete!"

