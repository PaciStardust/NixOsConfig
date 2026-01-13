{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-programs.orca-slicer.enable = lib.mkEnableOption "STRDST Orca Slicer";
  
  config = lib.mkIf config.strdst-programs.orca-slicer.enable {
    home.packages = with pkgs; [ orca-slicer ];
  };
}
