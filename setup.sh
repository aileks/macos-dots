#!/usr/bin/env bash

# nix stuff
sudo rm /etc/nixos/configuration.nix
sudo rm /etc/nixos/home.nix
sudo rm /etc/nixos/flake.nix
sudo rm /etc/nixos/spicetify.nix

sudo cp nixos/configuration.nix /etc/nixos/
sudo cp nixos/home.nix /etc/nixos/
sudo cp nixos/flake.nix /etc/nixos
sudo cp nixos/spicetify.nix /etc/nixos


## -------------------------------------------- ##
## TODO: Move most/all of this to home manager. ##
## -------------------------------------------- ##

# get dotdir (this directory)
DOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# theme stuff
cp -r $DOTDIR/.local $HOME
cp -r $DOTDIR/themes/* $HOME/.config
cp $DOTDIR/.Xresources $HOME

# symlinks
ln -sf $DOTDIR/tmux/tmux.conf $HOME/.tmux.conf
ln -sf $DOTDIR/zsh/zshrc $HOME/.zshrc
rm -rf $HOME/.config/nvim
ln -s $DOTDIR/nvim $HOME/.config/nvim
rm -rf $HOME/.config/i3
ln -s $DOTDIR/i3 $HOME/.config/i3
rm -rf $HOME/.config/i3blocks
ln -s $DOTDIR/i3blocks $HOME/.config/i3blocks
rm -rf $HOME/.config/picom
ln -s $DOTDIR/picom $HOME/.config/picom
rm -rf $HOME/.config/wezterm
ln -s $DOTDIR/wezterm $HOME/.config/wezterm
rm -rf $HOME/.config/doom
ln -s $DOTDIR/doom $HOME/.config/doom
rm -rf $HOME/.config/dunst
ln -s $DOTDIR/dunst $HOME/.config/dunst
rm -rf $HOME/.config/doom
ln -s $DOTDIR/doom $HOME/.config/doom

echo ""
echo "ALL DONE!"
echo "Now rebuild!"
echo ""
echo "Remember to copy git config files...you know who you are..."
echo ""
