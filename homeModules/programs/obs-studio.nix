{
  config, 
  lib, 
  ...
}:{
  options.strdst-programs.obs-studio.enable = lib.mkEnableOption "STRDST OBS Studio";
  
  config = lib.mkIf config.strdst-programs.obs-studio.enable {
    programs.obs-studio = {
      enable = true;
    };
  };
}
