{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-programs.signal.enable = lib.mkEnableOption "STRDST Signal";
  
  config = lib.mkIf config.strdst-programs.signal.enable {
    home.packages = with pkgs; [ signal-desktop ];
  };
}
