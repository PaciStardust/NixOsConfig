{
  config, 
  lib, 
  ...
}:{
  options.strdst-services.syncthing.enable = lib.mkEnableOption "STRDST Syncthing";
  
  config = lib.mkIf config.strdst-services.syncthing.enable {
    services.syncthing = {
      enable = true;
      settings = {
        gui = {
          metricsWithoutAuth = false;
        };
        options = {
          startBrowser = false;
          urPostInsecurely = false;
          minHomeDiskFree = "10%";
          overwriteRemoteDeviceNamesOnConnect = true;
        };
      };
    };
  };
}
