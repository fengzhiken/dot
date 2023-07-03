#!/bin/bash

rm -rf ~/.config/nvim
rm -rf ~/.config/alacritty
rm -rf ~/.config/sway
rm -rf ~/.config/swaylock
rm -rf ~/.config/waybar
rm -rf ~/.config/i3
rm -rf ~/Pictures/Wallpapers
rm -rf ~/Scripts

ln -s ~/dot/nvim ~/.config/nvim
ln -s ~/dot/alacritty ~/.config/alacritty
ln -s ~/dot/sway ~/.config/sway
ln -s ~/dot/swaylock ~/.config/swaylock
ln -s ~/dot/waybar ~/.config/waybar
ln -s ~/dot/i3 ~/.config/i3
ln -s ~/dot/Scripts ~/

mkdir Pictures
ln -s ~/dot/Wallpapers ~/Pictures
