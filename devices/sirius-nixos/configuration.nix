{
  pkgs,
  inputs,
  ... 
}:{
  imports =
  [ 
    ../../nixosModules
    ./hardware-configuration.nix
  ];

  networking.hostName = "sirius-nixos";
  # Load KMS early like arch
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "amdgpu" ];

  system.stateVersion = "25.11"; # Did you read the comment?

  users.users.paci = {
    isNormalUser = true;
    description = "Paci Stardust";
    extraGroups = [ "networkmanager" "wheel" "shareedit" ];
    shell = pkgs.zsh;
  };

  strdst-meta.setup-desktop-preferred.enable = true;
  strdst-meta.global-programs-all.enable = true;
  strdst-meta.package-groups-all.enable = true;

  strdst-global-shells.zsh.enable = true;

  home-manager.users.paci = {
    home.stateVersion = "25.11";

    imports = [
      inputs.plasma-manager.homeModules.plasma-manager
      ../../homeModules
    ];

    strdst-shells.zsh.enable = true;
    
    strdst-desktop-tweaks.plasma-manager.enable = true;

    strdst-meta.cli-all.enable = true;
    strdst-meta.services-all.enable = true;
    strdst-meta.programs-all.enable = true;

    strdst-cli.git.user-name = "PaciStardust";
    strdst-cli.git.user-mail = "git@paci.dev";
  };
}
