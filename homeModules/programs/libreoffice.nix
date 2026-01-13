{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-programs.libreoffice.enable = lib.mkEnableOption "STRDST Libre Office";
  
  config = lib.mkIf config.strdst-programs.libreoffice.enable {
    home.packages = with pkgs; [ libreoffice ];
  };
}
