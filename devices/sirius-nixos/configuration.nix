{ ... }:
{
  imports =
  [ 
    ../core/desktop
    ./hardware-configuration.nix
  ];

  networking.hostName = "sirius-nixos";

  system.stateVersion = "25.11"; # Did you read the comment?

  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "bak";
  home-manager.users.paci = {
    home.stateVersion = "25.11";
  };
}
