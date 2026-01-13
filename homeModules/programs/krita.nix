{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-programs.krita.enable = lib.mkEnableOption "STRDST Krita";
  
  config = lib.mkIf config.strdst-programs.krita.enable {
    home.packages = with pkgs; [ krita ];
  };
}
