{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-programs.heroic.enable = lib.mkEnableOption "STRDST Heroic Launcher";
  
  config = lib.mkIf config.strdst-programs.heroic.enable {
    home.packages = with pkgs; [ heroic ];
  };
}
