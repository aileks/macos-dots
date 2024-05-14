{ config, pkgs, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in
{
 # TODO: Add more comments...

  imports = [ spicetify-nix.homeManagerModule ];

  home.username = "aileks";
  home.homeDirectory = "/home/aileks";

  # TODO: Configure things like i3, ZSH, and Tmux using home manager.
  home.packages = with pkgs; [
    pfetch
      ripgrep
      eza
      tmux
      zoxide
      discord
      emacs-git
      freetube
      git
      neovim
      zsh
      dunst
  ];

  home.stateVersion = "23.11";

  programs = {
    home-manager.enable = true;
    spicetify = {
      enable = true;
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        shuffle
        hidePodcasts
      ];
    };
  };
}
