{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-programs.blender.enable = lib.mkEnableOption "STRDST Blender";
  
  config = lib.mkIf config.strdst-programs.blender.enable {
    home.packages = with pkgs; [ blender ];
  };
}
