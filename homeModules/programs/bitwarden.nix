{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-programs.bitwarden.enable = lib.mkEnableOption "STRDST Bitwarden";
  
  config = lib.mkIf config.strdst-programs.bitwarden.enable {
    home.packages = with pkgs; [ bitwarden-desktop ];
  };
}
