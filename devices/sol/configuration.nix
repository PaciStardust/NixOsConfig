{
  pkgs,
  config,
  ... 
}:{
  imports =
  [ 
    ../../nixosModules
    ./hardware-configuration.nix
  ];

  networking.hostName = "sol";

  system.stateVersion = "26.11"; # Did you read the comment?

  users.users.paci = {
    isNormalUser = true;
    initialPassword = "Meow";
    description = "Paci Stardust";
    extraGroups = [ "networkmanager" "wheel" "shareedit" "docker" ];
    shell = pkgs.zsh;
  };

  strdst-meta.setup-server-preferred.enable = true;

  strdst-global-shells.zsh.enable = true;

  virtualisation.vmVariant = {
    virtualisation.memorySize = 16384;
    virtualisation.cores = 8;
    virtualisation.diskSize = 100000;
  };

  home-manager.users.paci = {
    home.stateVersion = "26.11";

    imports = [
      ../../homeModules
    ];

    strdst-shells.zsh.enable = true;
    strdst-meta.cli-all.enable = true;

    strdst-cli.git.user-name = "PaciStardust";
    strdst-cli.git.user-mail = "git@paci.dev";
  };

  strdst-global-programs.docker.enable = true;

  boot.blacklistedKernelModules = [
    "nova_core"
    "nouveau"
  ];
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia-container-toolkit.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  environment.systemPackages = with pkgs; [
    cudaPackages.cudatoolkit
  ];
}
