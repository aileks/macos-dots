# Addicted to Configuration

### My dotfiles repo for WSL & Linux (Ubuntu)

#### Includes configuration for:
- WezTerm
- Zsh
- Neovim
- Tmux
- Fastfetch

#### Install general programs:
Debian/Ubuntu ([wezterm](https://wezfurlong.org/wezterm/install/linux.html#__tabbed_1_3) and [fastfetch](https://github.com/fastfetch-cli/fastfetch) need 3rd party repos)
```sh
sudo apt install git neovim zsh tmux wezterm fzf ripgrep eza trash-cli fastfetch dunst
```

Fedora ([wezterm](https://wezfurlong.org/wezterm/install/linux.html#__tabbed_1_4) needs COPR repo)
```sh
sudo dnf install -y git neovim zsh tmux wezterm fzf ripgrep eza trash-cli fastfetch dunst
```

Arch
```sh
sudo pacman -Syu git neovim zsh tmux wezterm fzf ripgrep eza trash-cli fastfetch dunst
```

Note: I use a [paid font](https://berkeleygraphics.com/typefaces/berkeley-mono/) for some of my configuration.
