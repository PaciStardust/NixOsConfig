{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-programs.unity.enable = lib.mkEnableOption "STRDST Unity + Alcom";
  
  config = lib.mkIf config.strdst-programs.unity.enable {
    home.packages = with pkgs; [ 
      unityhub
      alcom
    ];
  };
}
