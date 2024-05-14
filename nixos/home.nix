{ config, pkgs, ... }:

{
  # TODO: Add more comments...

  home.username = "aileks";
  home.homeDirectory = "/home/aileks";

  # TODO: Configure things like i3, ZSH, and Tmux using home manager.
  home.packages = with pkgs; [
    pfetch
    ripgrep
    spotify
    eza
    zoxide
    discord
    freetube
    git
    neovim
    zsh
    dunst
  ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
