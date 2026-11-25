{
  pkgs,
  ... 
}:{
  imports =
  [ 
    ../../nixosModules
    ./hardware-configuration.nix
  ];

  networking.hostName = "sol";
  strdst-core.nvidia.enable = true;

  system.stateVersion = "26.11"; # Did you read the comment?

  users.users.paci = {
    isNormalUser = true;
    initialPassword = "Meow";
    description = "Paci Stardust";
    extraGroups = [ "networkmanager" "wheel" "shareedit" "docker" ];
    shell = pkgs.zsh;
  };

  strdst-meta.setup-server-preferred.enable = true;

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

  environment.systemPackages = with pkgs; [
    cudaPackages.cudatoolkit
  ];
}
