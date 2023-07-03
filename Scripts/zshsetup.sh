#!/bin/bash

doas pacman -S zsh --needed

read -p "Do you want to make zsh as a default shell? (y/n) " is_default
if [ $is_default = "y" ]; then
  doas chsh -s $(whereis zsh)
fi

echo "Installing oh-my-zsh!"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing autosuggestions and autocompletions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
