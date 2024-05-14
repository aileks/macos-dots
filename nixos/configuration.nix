{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  # Get newer kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # Kernel boot params
  boot.kernelParams = [
    "loglevel=3"
    "quiet"
    "mitigations=off"
  ];

  nixpkgs = {
    # Community Emacs overlay for gccemacs
    overlays = [
      (import (builtins.fetchTarball {
        url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
      }))
    ];
    config = {
      allowUnfree = true;
    };
  };

  # Set locale options
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8"
    LC_IDENTIFICATION = "en_US.UTF-8"
    LC_MEASUREMENT = "en_US.UTF-8"
    LC_MONETARY = "en_US.UTF-8"
    LC_NAME = "en_US.UTF-8"
    LC_NUMERIC = "en_US.UTF-8"
    LC_PAPER = "en_US.UTF-8"
    LC_TELEPHONE = "en_US.UTF-8"
    LC_TIME = "en_US.UTF-8"
  };

  # Enable flakes
  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry = "";
      nix-path = config.nix.nixPath;
    };
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  # Set timezone
  time.timeZone = "America/New_York";

  # Set hostname and enable NM
  networking {
    hostName = "fbi-loft";
    networkManger.enable = true;
  };

  # Create user
  users.users.aileks = {
    isNormalUser = true;
    description = "aileks";
    extraGroups = [ "networkmanager" "wheel" "power" "disk" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAqYLXFqShbbZtnJaTuNsWPmYCL1E8z9+skiI9WZuNxn aeverly14@pm.me"
    ];
  };

  # Packages to install
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    dmenu
    gnome.gnome-keyring
    btop
    networkmanagerapplet
    wezterm
    feh
    picom
    polkit_gnome
    rofi
    neovim
    unrar
    unzip
    zsh
    dunst
    xclip
    yad
    playerctl
    maim
    xarchiver
    brave
    arandr
    zip
    gnupg
    gcc
    cmake
    gnumake
    binutils
    celluloid
    jq
    fzf
    fd
    xorg.xinput
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    btop
    sysstat
    lm_sensors
    pciutils
    usbutils
  ];

  # Install only specific nerd fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override = { fonts = [ "Agave" "Ubuntu" "JetBrainsMono" ]; })
  ];

  # Automated garbage collection
  nix = {
    settings.auto-optimise-store == true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Env vars
  environment.variables = {
    EDITOR = "nvim";
    # TODO: Finish path additions.
    PATH = [
      "\${HOME}/.local/bin"
      "\${HOME}/.cargo/bin"
      "\${HOME}/.ghcup/bin"
    ];
    # TODO: Add some missing env vars.
    NIXPKGS_ALLOW_UNFREE = "1";
    XCURSOR_THEME = "Catppuccin-Mocha-Light";
  };

  # System services
  services = {
    fstrim.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;
      desktopManager = {
        default = "none";
        xterm.enable = false;
        sddm.enable = true;
      };
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          i3blocks
          i3lock-fancy
        ];
      };
    };
    openssh = {
      enable = true;
      settings = {
        X11Forwarding = true;
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
      openFirewall = true;
    };
    blueman.enable = true;
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    emacs = {
      enable = true;
      package = pkgs.emacs-git;
    };
  };

  # Enable programs that require it outside of systemPackages
  programs = {
    thunar.enable = true;
    dconf.enable = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # Security services
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  # Enable gnome-polkit because using Linux is annoying otherwise
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart =
          "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # Enable hardware features and services
  hardware = {
    pulseaudio = true;
    bluetooth.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
    };
  };

  # Gotta hear...
  sound.enable = true;

  # System settings and auto-upgrading
  system = {
    stateVersion = "23.11";
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-23.11";
    };
  };
}
