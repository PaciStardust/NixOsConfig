{
  ... 
}:{
  imports =
  [ 
    ../core/desktop
    ./hardware-configuration.nix
    ../../programs
  ];

  networking.hostName = "sirius-nixos";
  # Load KMS early like arch
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "amdgpu" ];

  system.stateVersion = "25.11"; # Did you read the comment?

  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "bak";
  home-manager.users.paci = {
    home.stateVersion = "25.11";
  };
}
