{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-programs.tuta.enable = lib.mkEnableOption "STRDST Tuta";

  config = lib.mkIf config.strdst-programs.tuta.enable {
    home.packages = with pkgs; [ tutanota-desktop ];
  };
}
