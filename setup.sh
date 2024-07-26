#!/usr/bin/env bash

# get dotdir (this directory)
DOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# symlinks
ln -sf $DOTDIR/tmux/tmux.conf $HOME/.tmux.conf
ln -sf $DOTDIR/zsh/zshrc $HOME/.zshrc
rm -rf $HOME/.config/nvim
ln -s $DOTDIR/nvim $HOME/.config/nvim
rm -rf $HOME/.config/skhd
ln -s $DOTDIR/skhd $HOME/.config/skhd
rm -rf $HOME/.config/wezterm
ln -s $DOTDIR/wezterm $HOME/.config/wezterm

# zed is a special case
ln -sf $DOTDIR/zed/keymap.json $HOME/.config/zed/keymap.json
ln -sf $DOTDIR/zed/settings.json $HOME/.config/zed/settings.json
rm -rf $HOME/.config/zed/snippets
ln -s $DOTDIR/zed/snippets $HOME/.config/zed/snippets

# install omz
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo ""
echo "All done!"
echo "Remember to copy git config files!"
echo ""
