{ config, pkgs, ... }:

{
  home.username = "aileks";
  home.homeDirectory = "/home/aileks";

  home.packages = with pkgs; [
    pfetch
    ripgrep
    jq
    fzf
    fd
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    btop
    iotop
    iftop
    sysstat
    lm_sensors
    pciutils
    usbutils
    spotify
  ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
