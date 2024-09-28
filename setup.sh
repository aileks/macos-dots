#!/usr/bin/env bash

set -e

# get dotdir (this directory)
DOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

check_error() {
    if [ $? -ne 0 ]; then
        echo "Error occurred in script. Exiting."
        exit 1
    fi
}

# symlinks
ln -sf $DOTDIR/tmux/tmux.conf $HOME/.tmux.conf
check_error
ln -sf $DOTDIR/zsh/zshrc $HOME/.zshrc
check_error
rm -rf $HOME/.config/nvim
check_error
ln -s $DOTDIR/nvim $HOME/.config/nvim
check_error
rm -rf $HOME/.config/wezterm
check_error
# ln -s $DOTDIR/wezterm $HOME/.config/wezterm
# check_error

# zed is a special case
# ln -sf $DOTDIR/zed/keymap.json $HOME/.config/zed/keymap.json
# check_error
# ln -sf $DOTDIR/zed/settings.json $HOME/.config/zed/settings.json
# check_error
# rm -rf $HOME/.config/zed/snippets
# check_error
# ln -s $DOTDIR/zed/snippets $HOME/.config/zed/snippets
# check_error

# install omz
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    check_error
fi

echo ""
echo "Files Successfully Copied"
echo ""
