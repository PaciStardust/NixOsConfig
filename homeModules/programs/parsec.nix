{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-programs.parsec.enable = lib.mkEnableOption "STRDST Parsec";

  config = lib.mkIf config.strdst-programs.parsec.enable {
    home.packages = with pkgs; [ parsec-bin ];
  };
}
