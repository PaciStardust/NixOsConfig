{ pkgs, ... }: {
  imports = [
    ./secure-boot.nix
    ./user-paci.nix
    ../../../programs/essentials/cli
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  security.sudo = {
    enable = true;
    wheelNeedsPassword = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;

  services.hardware.bolt.enable = true; # thunderbolt
  hardware.graphics.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Allow unfree packages
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    bluez
    cron
    curl
    clamav
    dnsmasq
    docker
    docker-compose
    fd
    fzf
    git
    htop
    less
    libosinfo
    man-db
    man-pages
    microcode-amd
    neovim
    p7zip
    powertop
    power-profiles-daemon
    rsync
    screen
    wget
    wireguard-tools 
    zoxide
  ];

  # TuneD and Powertop for power management
  services.tuned.enable = true;
  powerManagement.powertop = {
    enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  services.openssh = {
    enable = true;
    banner = "Mrow?";
    ports = [
      13579
    ];

    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # Fail2Ban for SSH
  services.fail2ban = {
    enable = true;
    bantime-increment = {
      enable = true;
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # --- minimise old generations ---
  boot.loader.systemd-boot.configurationLimit = 20;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
  nix.settings.auto-optimise-store = true;

  # Shared Directory
  users.groups.shareedit.gid = 6789;
  systemd.tmpfiles.settings."shared"."/home/shared".d = {
    group = "shareedit";
    mode = "0775";
    user = "root";
  };
}
