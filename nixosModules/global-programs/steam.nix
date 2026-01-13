{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-global-programs.steam.enable = lib.mkEnableOption "STRDST Steam";
  
  config = lib.mkIf config.strdst-global-programs.steam.enable {
    programs.gamescope = {
      enable = true;
      capSysNice = true;
    };

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
      protontricks.enable = true;
      extraCompatPackages = with pkgs; [ 
        proton-ge-bin
      ];
    };

    hardware.steam-hardware.enable = true;
  };
}
