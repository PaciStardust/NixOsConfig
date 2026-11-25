{
  pkgs,
  inputs,
  ... 
}:{
  imports =
  [ 
    ../../nixosModules
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd
  ];

  networking.hostName = "sirius-nixos";
  strdst-core.amd.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?

  users.users.paci = {
    isNormalUser = true;
    initialPassword = "Meow";
    description = "Paci Stardust";
    extraGroups = [ "networkmanager" "wheel" "shareedit" ];
    shell = pkgs.zsh;
  };

  strdst-meta.setup-desktop-preferred.enable = true;
  strdst-meta.global-programs-all.enable = true;
  strdst-meta.package-groups-all.enable = true;

  home-manager.users.paci = {
    home.stateVersion = "25.11";

    imports = [
      # inputs.plasma-manager.homeModules.plasma-manager
      ../../homeModules
    ];

    strdst-shells.zsh.enable = true;
    
    # strdst-desktop-tweaks.plasma-manager.enable = true;
    strdst-desktop-tweaks.gnome.enable = true;

    strdst-meta.cli-all.enable = true;
    strdst-meta.services-all.enable = true;
    strdst-meta.programs-all.enable = true;

    strdst-cli.git.user-name = "PaciStardust";
    strdst-cli.git.user-mail = "git@paci.dev";
  };
}
