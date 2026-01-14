{
  config, 
  lib, 
  ...
}:{
  options.strdst-services.syncthing.enable = lib.mkEnableOption "STRDST Syncthing";
  
  config = lib.mkIf config.strdst-services.syncthing.enable {
    services.syncthing.enable = true;
  };
}
