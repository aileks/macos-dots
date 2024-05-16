#!/usr/bin/env bash
# !!! THIS IS THE macOS VERSION !!!

# get dotdir (this directory)
DOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# symlinks
ln -sf $DOTDIR/tmux/tmux.conf $HOME/.tmux.conf
ln -sf $DOTDIR/zsh/zshrc $HOME/.zshrc
rm -rf $HOME/.config/nvim
ln -s $DOTDIR/nvim $HOME/.config/nvim
rm -rf $HOME/.config/amethyst
cp -r $DOTDIR/amethyst $HOME/.config/amethyst
rm -rf $HOME/.config/wezterm
ln -s $DOTDIR/wezterm $HOME/.config/wezterm
rm -rf $HOME/.config/doom
ln -s $DOTDIR/doom $HOME/.config/doom
rm -rf $HOME/.config/skhd
ln -s $DOTDIR/skhd $HOME/.config/skhd
rm -rf $HOME/.config/sketchybar
ln -sf $DOTDIR/sketchybar $HOME/.config/sketchybar

echo ""
echo "All done!"
echo ""
