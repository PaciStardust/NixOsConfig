{
  config, 
  lib,
  ...
}:{
  imports = [
    ../services
  ];

  options.strdst-meta.services-all.enable = lib.mkEnableOption "STRDST META-Services All";
  
  config = lib.mkIf config.strdst-meta.services-all.enable {
    strdst-services.syncthing.enable = true;
  };
}
