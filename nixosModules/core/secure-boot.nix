{
  config, 
  lib, 
  pkgs, 
  inputs,
  ...
}:{
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  options.strdst-core.secure-boot.enable = lib.mkEnableOption "STRDST Core Secure Boot";
  
  config = lib.mkIf config.strdst-core.secure-boot.enable {    
    environment.systemPackages = [
      pkgs.sbctl
    ];

    # Lanzaboote currently replaces the systemd-boot module.
    # This setting is usually set to true in configuration.nix
    # generated at installation time. So we force it to false
    # for now.
    boot.loader.systemd-boot.enable = lib.mkForce false;

    boot.lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };
}
