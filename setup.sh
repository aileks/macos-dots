#!/usr/bin/env bash

DOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# symlinks
ln -sf $DOTDIR/tmux.conf $HOME/.tmux.conf
ln -sf $DOTDIR/zshrc $HOME/.zshrc
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

# theme stuff
cp -r $PWD/.local $HOME
cp -r $PWD/eyecandy/* $HOME/.config

echo ""
echo "ALL DONE!"
echo "NOW INSTALL YOUR PACKAGES!"
echo ""
