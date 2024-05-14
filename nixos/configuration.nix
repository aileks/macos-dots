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

  # Boot options
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "loglevel=3"
      "quiet"
      "mitigations=off"
    ];
    kernel.sysctl = { "vm.max_map_count" = 2147483642; };
    initrd.kernelModules = [ "amdgpu" ];
  };

  nixpkgs = {
    # Community Emacs overlay for gccemacs
    overlays = [
      (import (builtins.fetchTarball {
        url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
        sha256 = "0pr6issj2h707xfpysh1s9cjwhci4kai8pz3av6nvgm33m7s6r7f";
      }))
    ];
    config = {
      allowUnfree = true;
    };
  };

  # Set locale options
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nix = {
    # Enable garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry = "";
      nix-path = config.nix.nixPath;
      auto-optimise-store = true;
    };
  };

  # Set timezone
  time.timeZone = "America/New_York";

  # Set hostname and enable NM
  networking = {
    hostName = "fbi-loft";
    networkmanager.enable = true;
  };

  # Create user
  users.users.aileks = {
    isNormalUser = true;
    description = "aileks";
    extraGroups = [ "networkmanager" "wheel" "power" "disk" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAqYLXFqShbbZtnJaTuNsWPmYCL1E8z9+skiI9WZuNxn aeverly14@pm.me"
    ];
  };

  # Packages to install
  environment.systemPackages = with pkgs; [
    git
    wget
    killall
    pavucontrol
    curl
    libtool
    dmenu
    libgcc
    php83Packages.composer
    gnome.gnome-keyring
    btop
    networkmanagerapplet
    lxappearance
    trash-cli
    wezterm
    feh
    picom
    polkit_gnome
    rofi
    papirus-icon-theme
    neovim
    eza
    unrar
    unzip
    lua
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
    viewnior
    nodejs
    fontconfig
    xz
    python3
    pkg-config-unwrapped
    nix-search-cli
    stack
    haskell.compiler.ghc94
    haskell-language-server
    cabal-install
  ];

  # Automated garbage collection

  # Env vars
  environment.variables = {
    EDITOR = "nvim";
    # TODO: Finish path additions.
    PATH = [
      "\${HOME}/.local/bin"
      "\${HOME}/.cargo/bin"
      "\${HOME}/.ghcup/bin"
      "\${HOME}/.npm-global"
    ];
    # TODO: Add some missing env vars.
    NIXPKGS_ALLOW_UNFREE = "1";
    XCURSOR_THEME = "Catppuccin-Mocha-Light";
  };

  # System services
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      desktopManager = {
        xterm.enable = false;
      };
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          i3blocks
          i3lock-fancy
        ];
      };
      videoDrivers = [ "amdgpu" ];
    };
    displayManager = {
      defaultSession = "none+i3";
      sddm.enable = true;
    };
    libinput.enable = true;
    blueman.enable = true;
    fstrim.enable = true;
    openssh = {
      enable = true;
      settings = {
        X11Forwarding = true;
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
      openFirewall = true;
    };
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    tumbler.enable = true;
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
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    # Enable dynamically linked executables
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        alsa-lib
        at-spi2-atk
        at-spi2-core
        atk
        cairo
        cups
        curl
        dbus
        expat
        fontconfig
        freetype
        fuse3
        gdk-pixbuf
        glib
        gtk3
        icu
        libGL
        libappindicator-gtk3
        libdrm
        libglvnd
        libnotify
        libpulseaudio
        libunwind
        libusb1
        libuuid
        libxkbcommon
        libxml2
        mesa
        nspr
        nss
        openssl
        pango
        pipewire
        stdenv.cc.cc
        systemd
        vulkan-loader
        xorg.libX11
        xorg.libXScrnSaver
        xorg.libXcomposite
        xorg.libXcursor
        xorg.libXdamage
        xorg.libXext
        xorg.libXfixes
        xorg.libXi
        xorg.libXrandr
        xorg.libXrender
        xorg.libXtst
        xorg.libxcb
        xorg.libxkbfile
        xorg.libxshmfence
        zlib      ];
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
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
        amdvlk
      ];
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
